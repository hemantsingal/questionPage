// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 0;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      id: fields[0] as int,
      chapter: fields[1] as String,
      topic: fields[2] as String,
      question: fields[3] as String,
      options: (fields[4] as List).cast<String>(),
      correctIndex: fields[5] as int,
      difficulty: fields[6] as int,
      explanation: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Question obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chapter)
      ..writeByte(2)
      ..write(obj.topic)
      ..writeByte(3)
      ..write(obj.question)
      ..writeByte(4)
      ..write(obj.options)
      ..writeByte(5)
      ..write(obj.correctIndex)
      ..writeByte(6)
      ..write(obj.difficulty)
      ..writeByte(7)
      ..write(obj.explanation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$QuestionImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'id',
            'chapter',
            'topic',
            'question',
            'options',
            'correctIndex',
            'difficulty',
            'explanation'
          ],
        );
        final val = _$QuestionImpl(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          chapter: $checkedConvert('chapter', (v) => v as String),
          topic: $checkedConvert('topic', (v) => v as String),
          question: $checkedConvert('question', (v) => v as String),
          options: $checkedConvert('options',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          correctIndex:
              $checkedConvert('correctIndex', (v) => (v as num).toInt()),
          difficulty: $checkedConvert('difficulty', (v) => (v as num).toInt()),
          explanation: $checkedConvert('explanation', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapter': instance.chapter,
      'topic': instance.topic,
      'question': instance.question,
      'options': instance.options,
      'correctIndex': instance.correctIndex,
      'difficulty': instance.difficulty,
      'explanation': instance.explanation,
    };
