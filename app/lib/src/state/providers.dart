import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/question_repository.dart';
import '../services/question_randomizer.dart';
import 'quiz_controller.dart';
import 'quiz_state.dart';

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return QuestionRepository();
});

final questionRandomizerProvider = Provider<QuestionRandomizer>((ref) {
  return const QuestionRandomizer();
});

final quizControllerProvider =
    StateNotifierProvider.autoDispose<QuizController, QuizState>(
  (ref) {
    final repository = ref.watch(questionRepositoryProvider);
    final randomizer = ref.watch(questionRandomizerProvider);
    return QuizController(
      repository: repository,
      randomizer: randomizer,
    );
  },
);

