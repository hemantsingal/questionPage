import 'package:app/src/data/question_repository.dart';
import 'package:app/src/models/question.dart';

class FakeQuestionRepository extends QuestionRepository {
  FakeQuestionRepository(this._questions);

  final List<Question> _questions;

  @override
  Future<List<Question>> fetchQuestions() async {
    return List<Question>.from(_questions);
  }
}

