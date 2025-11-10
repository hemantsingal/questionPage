import 'package:app/src/models/question.dart';
import 'package:app/src/services/question_randomizer.dart';
import 'package:flutter_test/flutter_test.dart';

Question buildQuestion(int id) => Question(
      id: id,
      chapter: 'Chapter $id',
      topic: 'Topic $id',
      question: 'Question $id',
      options: const ['A', 'B', 'C', 'D'],
      correctIndex: 0,
      difficulty: 1,
      explanation: 'Explanation $id',
    );

void main() {
  group('QuestionRandomizer', () {
    const randomizer = QuestionRandomizer();
    final questions = List<Question>.generate(5, buildQuestion);

    test('returns new list instance', () {
      final shuffled = randomizer.shuffle(questions, seed: 1);

      expect(identical(shuffled, questions), isFalse);
      expect(shuffled, containsAll(questions));
    });

    test('produces deterministic order with seed', () {
      final shuffledA = randomizer.shuffle(questions, seed: 42);
      final shuffledB = randomizer.shuffle(questions, seed: 42);

      expect(shuffledA, shuffledB);
    });
  });
}

