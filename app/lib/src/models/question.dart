import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@Freezed()
@HiveType(typeId: 0, adapterName: 'QuestionAdapter')
class Question with _$Question {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    explicitToJson: true,
    checked: true,
    disallowUnrecognizedKeys: true,
  )
  const factory Question({
    @HiveField(0) required int id,
    @HiveField(1) required String chapter,
    @HiveField(2) required String topic,
    @HiveField(3) required String question,
    @HiveField(4) required List<String> options,
    @HiveField(5) required int correctIndex,
    @HiveField(6) required int difficulty,
    @HiveField(7) required String explanation,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

