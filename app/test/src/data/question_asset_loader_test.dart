import 'package:app/src/data/question_asset_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeAssetBundle extends CachingAssetBundle {
  FakeAssetBundle(this.assets);

  final Map<String, String> assets;

  @override
  Future<ByteData> load(String key) {
    throw UnimplementedError('Binary load not supported in FakeAssetBundle');
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final value = assets[key];
    if (value == null) {
      throw FlutterError('Asset not found: $key');
    }
    return value;
  }
}

void main() {
  group('QuestionAssetLoader', () {
    test('parses list of maps from asset bundle', () async {
      final loader = QuestionAssetLoader(
        assetPath: 'questions.json',
        bundle: FakeAssetBundle({
          'questions.json': '[{"id":1,"chapter":"Algebra","topic":"Topic","question":"Q","options":["A","B","C","D"],"correctIndex":0,"difficulty":1,"explanation":"Because"}]',
        }),
      );

      final result = await loader.load();

      expect(result.length, 1);
      expect(result.first['id'], 1);
    });

    test('throws FormatException when asset is not a list', () async {
      final loader = QuestionAssetLoader(
        assetPath: 'questions.json',
        bundle: FakeAssetBundle({'questions.json': '{"id":1}'}),
      );

      expect(
        () => loader.load(),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws FormatException when entry is not a map', () async {
      final loader = QuestionAssetLoader(
        assetPath: 'questions.json',
        bundle: FakeAssetBundle({'questions.json': '[1, 2, 3]'}),
      );

      expect(
        () => loader.load(),
        throwsA(isA<FormatException>()),
      );
    });
  });
}

