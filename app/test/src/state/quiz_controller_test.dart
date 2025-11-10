import 'dart:async';

import 'package:app/src/models/question.dart';

import 'package:app/src/services/question_randomizer.dart';
import 'package:app/src/state/providers.dart';
import 'package:app/src/state/quiz_controller.dart';
import 'package:app/src/state/quiz_state.dart';
import 'package:app/src/state/quiz_toast.dart';
import 'package:app/src/state/submission_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/fake_question_repository.dart';

Question buildQuestion(int id, {int correctIndex = 1}) => Question(
      id: id,
      chapter: 'Chapter $id',
      topic: 'Topic $id',
      question: 'Question $id?',
      options: const ['A', 'B', 'C', 'D'],
      correctIndex: correctIndex,
      difficulty: 1,
      explanation: 'Explanation $id',
    );

class IdentityRandomizer extends QuestionRandomizer {
  const IdentityRandomizer();

  @override
  List<Question> shuffle(
    List<Question> questions, {
    int? seed,
  }) {
    return List<Question>.from(questions);
  }
}

ProviderContainer buildContainer({
  required List<Question> questions,
}) {
  final repository = FakeQuestionRepository(questions);
  final container = ProviderContainer(
    overrides: [
      questionRepositoryProvider.overrideWithValue(repository),
      questionRandomizerProvider.overrideWithValue(const IdentityRandomizer()),
    ],
  );
  return container;
}

Future<void> waitForQuizReady(ProviderContainer container) {
  final completer = Completer<void>();
  final sub = container.listen<QuizState>(
    quizControllerProvider,
    (prev, next) {
      if (!completer.isCompleted &&
          (next is QuizStateActive || next is QuizStateCompleted)) {
        completer.complete();
      }
    },
    fireImmediately: true,
  );
  return completer.future.whenComplete(sub.close);
}

void main() {
  group('QuizController', () {
    test('initializes with questions and running timer', () async {
      final container = buildContainer(
        questions: [buildQuestion(1), buildQuestion(2)],
      );
      await waitForQuizReady(container);

      final state = container.read(quizControllerProvider);
      expect(state, isA<QuizStateActive>());
      final active = state as QuizStateActive;
      expect(active.questions.length, 2);
      expect(active.secondsRemaining, 10);
      expect(active.isTimerRunning, isTrue);

      container.dispose();
    });

    test('awards XP and increments streak on correct submission', () async {
      final container = buildContainer(
        questions: [buildQuestion(1, correctIndex: 2)],
      );
      await waitForQuizReady(container);

      final notifier = container.read(quizControllerProvider.notifier);
      notifier.selectOption(2);
      notifier.submitAnswer();

      final state = container.read(quizControllerProvider) as QuizStateActive;
      expect(state.submissionStatus, SubmissionStatus.correct);
      expect(state.totalXp, 100);
      expect(state.streakCount, 1);
      expect(state.correctCount, 1);

      container.dispose();
    });

    test('resets streak and emits reset toast on incorrect submission',
        () async {
      final container = buildContainer(
        questions: [buildQuestion(1, correctIndex: 2)],
      );
      await waitForQuizReady(container);

      final notifier = container.read(quizControllerProvider.notifier);
      notifier.selectOption(0);
      notifier.submitAnswer();

      final state = container.read(quizControllerProvider) as QuizStateActive;
      expect(state.submissionStatus, SubmissionStatus.incorrect);
      expect(state.totalXp, 0);
      expect(state.streakCount, 0);
      expect(state.incorrectCount, 1);
      expect(state.activeToast?.type, QuizToastType.reset);

      container.dispose();
    });

    test('emits streak toast when threshold reached', () async {
      final container = buildContainer(
        questions: [
          buildQuestion(1, correctIndex: 0),
          buildQuestion(2, correctIndex: 0),
          buildQuestion(3, correctIndex: 0),
        ],
      );
      await waitForQuizReady(container);

      final notifier = container.read(quizControllerProvider.notifier);
      QuizToast? streakToast;

      for (var i = 0; i < 3; i++) {
        notifier.selectOption(0);
        notifier.submitAnswer();
        final current = container.read(quizControllerProvider);
        expect(current, isA<QuizStateActive>());
        final active = current as QuizStateActive;
        if (i < 2) {
          expect(active.activeToast, isNull);
          notifier.nextQuestion();
        } else {
          streakToast = active.activeToast;
          notifier.nextQuestion();
        }
      }

      final state = container.read(quizControllerProvider);
      expect(state, isA<QuizStateCompleted>());
      final completed = state as QuizStateCompleted;
      expect(completed.totalXp, 300);
      expect(streakToast?.type, QuizToastType.streak);

      container.dispose();
    });

    test('timer countdown triggers timeout', () async {
      final controller = QuizController(
        repository: FakeQuestionRepository([buildQuestion(1, correctIndex: 0)]),
        randomizer: const IdentityRandomizer(),
        tickInterval: const Duration(milliseconds: 25),
      );

      // Wait for controller to enter active state.
      var attempts = 0;
      while (controller.state is QuizStateLoading && attempts < 20) {
        await Future<void>.delayed(const Duration(milliseconds: 5));
        attempts++;
      }
      expect(controller.state, isA<QuizStateActive>());

      // Allow timer to elapse.
      await Future<void>.delayed(const Duration(milliseconds: 300));

      final state = controller.state;
      expect(state, isA<QuizStateActive>());
      final active = state as QuizStateActive;
      expect(active.submissionStatus, SubmissionStatus.timedOut);
      expect(active.activeToast?.type, QuizToastType.reset);
      expect(active.isTimerRunning, isFalse);

      controller.dispose();
    });

    test('nextQuestion advances and completion state emitted at end',
        () async {
      final container = buildContainer(
        questions: [
          buildQuestion(1, correctIndex: 0),
          buildQuestion(2, correctIndex: 3),
        ],
      );
      await waitForQuizReady(container);

      final notifier = container.read(quizControllerProvider.notifier);
      notifier.selectOption(0);
      notifier.submitAnswer();
      notifier.nextQuestion();

      final stateAfterFirst =
          container.read(quizControllerProvider) as QuizStateActive;
      expect(stateAfterFirst.currentIndex, 1);
      expect(stateAfterFirst.submissionStatus, SubmissionStatus.pending);
      expect(stateAfterFirst.secondsRemaining, 10);

      notifier.selectOption(1);
      notifier.submitAnswer();
      notifier.nextQuestion();

      final completed =
          container.read(quizControllerProvider) as QuizStateCompleted;
      expect(completed.questions.length, 2);
      expect(completed.totalXp, 100);
      expect(completed.correctCount, 1);
      expect(completed.incorrectCount, 1);

      container.dispose();
    });
  });
}

