import 'package:app/src/data/question_asset_loader.dart';
import 'package:app/src/data/question_repository.dart';
import 'package:app/src/models/question.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';

class StubQuestionAssetLoader extends QuestionAssetLoader {
  StubQuestionAssetLoader(this._payload);

  final List<Map<String, dynamic>> _payload;

  @override
  Future<List<Map<String, dynamic>>> load() async => _payload;
}

void main() {
  group('QuestionRepository', () {
    final questionJson = <String, dynamic>{
      'id': 1,
      'chapter': 'Math',
      'topic': 'Addition',
      'question': '1+1=?',
      'options': ['0', '1', '2', '3'],
      'correctIndex': 2,
      'difficulty': 1,
      'explanation': 'Basic arithmetic.',
    };

    test('fetchQuestions returns typed Question instances', () async {
      final repository = QuestionRepository(
        loader: StubQuestionAssetLoader([questionJson]),
      );

      final result = await repository.fetchQuestions();

      expect(result, hasLength(1));
      expect(result.first, isA<Question>());
      expect(result.first.correctIndex, 2);
    });

    test('propagates parsing errors when JSON invalid', () async {
      final repository = QuestionRepository(
        loader: StubQuestionAssetLoader([
          <String, dynamic>{
            'id': 1,
            'chapter': 'Math',
          }
        ]),
      );

      expect(
        () => repository.fetchQuestions(),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });
  });
}

