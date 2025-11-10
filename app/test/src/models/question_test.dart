import 'package:app/src/models/question.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';

void main() {
  group('Question', () {
    final json = <String, dynamic>{
      'id': 42,
      'chapter': 'Algebra',
      'topic': 'Quadratics',
      'question': 'What is 2 + 2?',
      'options': ['1', '2', '3', '4'],
      'correctIndex': 3,
      'difficulty': 1,
      'explanation': 'Because math.',
    };

    test('fromJson parses valid payload', () {
      final question = Question.fromJson(json);

      expect(question.id, 42);
      expect(question.options, ['1', '2', '3', '4']);
      expect(question.correctIndex, 3);
    });

    test('toJson yields serializable map', () {
      final question = Question.fromJson(json);

      expect(question.toJson(), json);
    });

    test('fromJson throws when missing required field', () {
      final invalidJson = Map<String, dynamic>.from(json)
        ..remove('question');

      expect(
        () => Question.fromJson(invalidJson),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });

    test('fromJson throws when options is not list', () {
      final invalidJson = Map<String, dynamic>.from(json)
        ..['options'] = 'not a list';

      expect(
        () => Question.fromJson(invalidJson),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });
  });
}

