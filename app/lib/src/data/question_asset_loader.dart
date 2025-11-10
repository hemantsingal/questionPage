import 'dart:convert';

import 'package:flutter/services.dart' show AssetBundle, rootBundle;

class QuestionAssetLoader {
  const QuestionAssetLoader({
    this.assetPath = 'assets/questions.json',
    AssetBundle? bundle,
  }) : _bundle = bundle;

  final String assetPath;
  final AssetBundle? _bundle;

  Future<List<Map<String, dynamic>>> load() async {
    final rawJson = await (_bundle ?? rootBundle).loadString(assetPath);
    final decoded = json.decode(rawJson);

    if (decoded is! List<dynamic>) {
      throw const FormatException('Questions asset must decode to a list.');
    }

    return decoded.map((dynamic entry) {
      if (entry is Map<String, dynamic>) {
        return Map<String, dynamic>.from(entry);
      }
      throw FormatException(
        'Each question must be a map, but found ${entry.runtimeType}.',
      );
    }).toList();
  }
}

