import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_toast.freezed.dart';

enum QuizToastType { streak, reset }

@freezed
class QuizToast with _$QuizToast {
  const factory QuizToast({
    required int id,
    required QuizToastType type,
    required String message,
  }) = _QuizToast;
}

