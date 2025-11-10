import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/question.dart';
import 'quiz_toast.dart';
import 'submission_status.dart';

part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.loading() = QuizStateLoading;

  const factory QuizState.active({
    required List<Question> questions,
    required int currentIndex,
    int? selectedOptionIndex,
    @Default(SubmissionStatus.pending) SubmissionStatus submissionStatus,
    @Default(0) int totalXp,
    @Default(0) int streakCount,
    @Default(0) int correctCount,
    @Default(0) int incorrectCount,
    QuizToast? activeToast,
    @Default(10) int durationSeconds,
    @Default(10) int secondsRemaining,
    @Default(false) bool isTimerRunning,
  }) = QuizStateActive;

  const factory QuizState.completed({
    required List<Question> questions,
    required int totalXp,
    required int correctCount,
    required int incorrectCount,
    required int finalStreakCount,
  }) = QuizStateCompleted;
}

extension QuizStateActiveX on QuizStateActive {
  Question get currentQuestion => questions[currentIndex];

  bool get isAnswered => submissionStatus != SubmissionStatus.pending;
}

