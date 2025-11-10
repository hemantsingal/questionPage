import 'dart:math';

import '../models/question.dart';

class QuestionRandomizer {
  const QuestionRandomizer();

  List<Question> shuffle(
    List<Question> questions, {
    int? seed,
  }) {
    final random = seed == null ? Random() : Random(seed);
    final copy = List<Question>.from(questions);
    for (var i = copy.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = copy[i];
      copy[i] = copy[j];
      copy[j] = temp;
    }
    return copy;
  }
}

