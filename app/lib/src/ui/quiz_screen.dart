import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/providers.dart';
import '../state/quiz_state.dart';
import '../state/quiz_toast.dart';
import '../state/submission_status.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);

    return state.map(
      loading: (_) => const _LoadingView(),
      active: (active) => _ActiveQuizView(activeState: active),
      completed: (completed) => _CompletedView(completedState: completed),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _ActiveQuizView extends ConsumerWidget {
  const _ActiveQuizView({required this.activeState});

  final QuizStateActive activeState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(quizControllerProvider.notifier);
    final question = activeState.currentQuestion;
    final canSubmit = !activeState.isAnswered &&
        activeState.selectedOptionIndex != null &&
        activeState.secondsRemaining > 0;
    final canGoNext = activeState.isAnswered;
    final progress =
        activeState.durationSeconds == 0 ? 0.0 : activeState.secondsRemaining / activeState.durationSeconds;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _QuizToastBanner(state: activeState),
          _Header(
            currentIndex: activeState.currentIndex,
            total: activeState.questions.length,
            totalXp: activeState.totalXp,
          ),
          const SizedBox(height: 12),
          _TimerBar(progress: progress, secondsRemaining: activeState.secondsRemaining),
          const SizedBox(height: 16),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question.chapter,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    question.topic,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    question.question,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: question.options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) => _OptionTile(
                index: index,
                optionText: question.options[index],
                correctIndex: question.correctIndex,
                selectedIndex: activeState.selectedOptionIndex,
                submissionStatus: activeState.submissionStatus,
                onTap: activeState.isAnswered
                    ? null
                    : () => controller.selectOption(index),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  key: const Key('submitButton'),
                  onPressed: canSubmit ? controller.submitAnswer : null,
                  child: const Text('Submit Answer'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  key: const Key('nextButton'),
                  onPressed: canGoNext ? controller.nextQuestion : null,
                  child: const Text('Next Question'),
                ),
              ),
            ],
          ),
          if (activeState.isAnswered) ...[
            const SizedBox(height: 16),
            _ExplanationCard(
              explanation: question.explanation,
              isCorrect: activeState.submissionStatus == SubmissionStatus.correct,
            ),
          ],
        ],
      ),
    );
  }
}

class _CompletedView extends ConsumerWidget {
  const _CompletedView({required this.completedState});

  final QuizStateCompleted completedState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(quizControllerProvider.notifier);
    final totalQuestions = completedState.questions.length;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.emoji_events, size: 72),
          const SizedBox(height: 16),
          Text(
            'Quiz Complete!',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Correct answers: ${completedState.correctCount} / $totalQuestions',
            textAlign: TextAlign.center,
          ),
          Text(
            'Total XP earned: ${completedState.totalXp}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: controller.resetQuiz,
            child: const Text('Retry Quiz'),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.currentIndex,
    required this.total,
    required this.totalXp,
  });

  final int currentIndex;
  final int total;
  final int totalXp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Question ${currentIndex + 1} of $total',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'XP: $totalXp',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

class _TimerBar extends StatelessWidget {
  const _TimerBar({
    required this.progress,
    required this.secondsRemaining,
  });

  final double progress;
  final int secondsRemaining;

  @override
  Widget build(BuildContext context) {
    final safeProgress = progress.clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: safeProgress,
          minHeight: 8,
        ),
        const SizedBox(height: 4),
        Text('Time left: ${secondsRemaining}s'),
      ],
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.index,
    required this.optionText,
    required this.correctIndex,
    required this.selectedIndex,
    required this.submissionStatus,
    required this.onTap,
  });

  final int index;
  final String optionText;
  final int correctIndex;
  final int? selectedIndex;
  final SubmissionStatus submissionStatus;
  final VoidCallback? onTap;

  Color? _backgroundColor(BuildContext context) {
    if (submissionStatus == SubmissionStatus.pending) {
      if (selectedIndex == index) {
        return Theme.of(context)
            .colorScheme
            .primary
            .withValues(alpha: 0.12);
      }
      return null;
    }
    if (index == correctIndex) {
      return Colors.green.shade100;
    }
    if (selectedIndex == index &&
        (submissionStatus == SubmissionStatus.incorrect ||
            submissionStatus == SubmissionStatus.timedOut)) {
      return Colors.red.shade100;
    }
    return null;
  }

  IconData? _iconData() {
    if (submissionStatus == SubmissionStatus.pending) {
      return selectedIndex == index ? Icons.radio_button_checked : Icons.circle_outlined;
    }
    if (index == correctIndex) {
      return Icons.check_circle;
    }
    if (selectedIndex == index) {
      return Icons.cancel;
    }
    return Icons.circle_outlined;
  }

  Color? _iconColor() {
    if (submissionStatus == SubmissionStatus.pending) {
      return selectedIndex == index ? Colors.blue : null;
    }
    if (index == correctIndex) {
      return Colors.green;
    }
    if (selectedIndex == index) {
      return Colors.red;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final background = _backgroundColor(context);
    final icon = _iconData();

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: _iconColor()),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  optionText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExplanationCard extends StatelessWidget {
  const _ExplanationCard({
    required this.explanation,
    required this.isCorrect,
  });

  final String explanation;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final title = isCorrect ? 'Great job!' : 'Here’s the explanation';
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              explanation,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizToastBanner extends ConsumerWidget {
  const _QuizToastBanner({required this.state});

  final QuizStateActive state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = state.activeToast;
    if (toast == null) {
      return const SizedBox.shrink();
    }

    final controller = ref.read(quizControllerProvider.notifier);
    final color = toast.type == QuizToastType.streak
        ? Colors.green.shade100
        : Colors.orange.shade100;
    final textColor =
        toast.type == QuizToastType.streak ? Colors.green.shade900 : Colors.orange.shade900;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Dismissible(
        key: ValueKey(toast.id),
        direction: DismissDirection.up,
        onDismissed: (_) => controller.acknowledgeToast(toast.id),
        child: Card(
          color: color,
          child: ListTile(
            leading: Icon(
              toast.type == QuizToastType.streak ? Icons.local_fire_department : Icons.info,
              color: textColor,
            ),
            title: Text(
              toast.message,
              style: TextStyle(color: textColor),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              color: textColor,
              onPressed: () => controller.acknowledgeToast(toast.id),
            ),
          ),
        ),
      ),
    );
  }
}

