import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/question_repository.dart';
import '../services/question_randomizer.dart';
import 'quiz_state.dart';
import 'quiz_toast.dart';
import 'submission_status.dart';

typedef _ActiveReducer = QuizStateActive Function(QuizStateActive state);

class QuizController extends StateNotifier<QuizState> {
  QuizController({
    required QuestionRepository repository,
    required QuestionRandomizer randomizer,
    this.baseXp = 100,
    this.questionDuration = const Duration(seconds: 10),
    this.tickInterval = const Duration(seconds: 1),
    this.streakToastThreshold = 3,
    this.streakMessages = const [
      'Nice work! You’re on a streak.',
      'Awesome momentum! Keep it up.',
      'You’re unstoppable!',
    ],
    this.streakResetMessage = 'Streak reset. You’ve got this—keep going!',
  })  : _repository = repository,
        _randomizer = randomizer,
        super(const QuizState.loading()) {
    unawaited(_prepareSession());
  }

  final QuestionRepository _repository;
  final QuestionRandomizer _randomizer;
  final int baseXp;
  final Duration questionDuration;
  final int streakToastThreshold;
  final List<String> streakMessages;
  final String streakResetMessage;
  final Duration tickInterval;

  Timer? _timer;
  int _toastCounter = 0;

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  Future<void> _prepareSession() async {
    _cancelTimer();
    final questions = await _repository.fetchQuestions();

    if (!mounted) {
      return;
    }

    if (questions.isEmpty) {
      state = const QuizState.completed(
        questions: [],
        totalXp: 0,
        correctCount: 0,
        incorrectCount: 0,
        finalStreakCount: 0,
      );
      return;
    }

    final shuffled = _randomizer.shuffle(questions);
    state = QuizState.active(
      questions: shuffled,
      currentIndex: 0,
      durationSeconds: questionDuration.inSeconds,
      secondsRemaining: questionDuration.inSeconds,
      isTimerRunning: false,
    );
    _startTimer(resetSeconds: false);
  }

  void selectOption(int optionIndex) {
    _updateActive((active) {
      if (active.isAnswered) {
        return active;
      }
      return active.copyWith(selectedOptionIndex: optionIndex);
    });
  }

  void submitAnswer() {
    _updateActive((active) {
      if (active.isAnswered) {
        return active;
      }
      final selected = active.selectedOptionIndex;
      if (selected == null) {
        return active;
      }
      final isCorrect = selected == active.currentQuestion.correctIndex;
      _cancelTimer();
      if (isCorrect) {
        final nextStreak = active.streakCount + 1;
        return active.copyWith(
          submissionStatus: SubmissionStatus.correct,
          totalXp: active.totalXp + baseXp,
          streakCount: nextStreak,
          correctCount: active.correctCount + 1,
          activeToast: _buildStreakToast(nextStreak),
          isTimerRunning: false,
        );
      }
      return _markIncorrect(active, SubmissionStatus.incorrect);
    });
  }

  void handleTimeout() {
    _updateActive((active) {
      if (active.isAnswered) {
        return active;
      }
      _cancelTimer();
      return _markIncorrect(active, SubmissionStatus.timedOut);
    });
  }

  void nextQuestion() {
    _updateActive((active) {
      if (!active.isAnswered) {
        return active;
      }
      final nextIndex = active.currentIndex + 1;
      if (nextIndex >= active.questions.length) {
        state = QuizState.completed(
          questions: active.questions,
          totalXp: active.totalXp,
          correctCount: active.correctCount,
          incorrectCount: active.incorrectCount,
          finalStreakCount: active.streakCount,
        );
        return active;
      }
      final updated = active.copyWith(
        currentIndex: nextIndex,
        selectedOptionIndex: null,
        submissionStatus: SubmissionStatus.pending,
        activeToast: null,
        durationSeconds: questionDuration.inSeconds,
        secondsRemaining: questionDuration.inSeconds,
        isTimerRunning: false,
      );
      state = updated;
      _startTimer(resetSeconds: false);
      return updated;
    });
  }

  void resetQuiz() {
    if (state is QuizStateLoading) {
      return;
    }
    state = const QuizState.loading();
    unawaited(_prepareSession());
  }

  void acknowledgeToast(int toastId) {
    _updateActive((active) {
      if (active.activeToast?.id == toastId) {
        return active.copyWith(activeToast: null);
      }
      return active;
    });
  }

  void _updateActive(_ActiveReducer reducer) {
    final current = state;
    if (current is QuizStateActive) {
      final updated = reducer(current);
      if (identical(updated, current)) {
        return;
      }
      state = updated;
    }
  }

  QuizStateActive _markIncorrect(
    QuizStateActive active,
    SubmissionStatus status,
  ) {
    final toast = _buildResetToast();
    return active.copyWith(
      submissionStatus: status,
      streakCount: 0,
      incorrectCount: active.incorrectCount + 1,
      activeToast: toast,
      isTimerRunning: false,
    );
  }

  QuizToast? _buildStreakToast(int streak) {
    if (streak < streakToastThreshold) {
      return null;
    }
    final message = streakMessages[(streak - streakToastThreshold) %
        streakMessages.length];
    return QuizToast(
      id: ++_toastCounter,
      type: QuizToastType.streak,
      message: message,
    );
  }

  QuizToast _buildResetToast() {
    return QuizToast(
      id: ++_toastCounter,
      type: QuizToastType.reset,
      message: streakResetMessage,
    );
  }

  void _startTimer({required bool resetSeconds}) {
    _cancelTimer();
    _updateActive((active) {
      final updatedSeconds = resetSeconds
          ? questionDuration.inSeconds
          : active.secondsRemaining;
      return active.copyWith(
        secondsRemaining: updatedSeconds,
        isTimerRunning: true,
      );
    });
    _timer = Timer.periodic(tickInterval, (_) {
      _tick();
    });
  }

  void _tick() {
    final current = state;
    if (current is! QuizStateActive) {
      _cancelTimer();
      return;
    }
    if (!current.isTimerRunning) {
      return;
    }
    final remaining = current.secondsRemaining - 1;
    if (remaining <= 0) {
      state = current.copyWith(
        secondsRemaining: 0,
        isTimerRunning: false,
      );
      _cancelTimer();
      handleTimeout();
    } else {
      state = current.copyWith(
        secondsRemaining: remaining,
      );
    }
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}

