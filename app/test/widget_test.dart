// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('QuizApp loads questions from asset', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: QuizApp()),
    );

    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text('Questions loaded: 10'), findsOneWidget);
  });
}
