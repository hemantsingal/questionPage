import '../models/question.dart';
import 'question_asset_loader.dart';

class QuestionRepository {
  QuestionRepository({
    QuestionAssetLoader? loader,
  }) : _loader = loader ?? const QuestionAssetLoader();

  final QuestionAssetLoader _loader;

  Future<List<Question>> fetchQuestions() async {
    final rawQuestions = await _loader.load();
    return rawQuestions.map(Question.fromJson).toList(growable: false);
  }
}

