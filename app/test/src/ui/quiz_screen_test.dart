import 'package:app/src/data/question_repository.dart';
import 'package:app/src/models/question.dart';
import 'package:app/src/services/question_randomizer.dart';
import 'package:app/src/state/providers.dart';
import 'package:app/src/state/quiz_controller.dart';
import 'package:app/src/ui/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils/fake_question_repository.dart';

Question buildQuestion({
  required int id,
  required int correctIndex,
  String? questionText,
}) {
  return Question(
    id: id,
    chapter: 'Chapter $id',
    topic: 'Topic $id',
    question: questionText ?? 'Question $id?',
    options: const ['Option A', 'Option B', 'Option C', 'Option D'],
    correctIndex: correctIndex,
    difficulty: 1,
    explanation: 'Explanation for question $id.',
  );
}

class IdentityRandomizer extends QuestionRandomizer {
  const IdentityRandomizer();

  @override
  List<Question> shuffle(List<Question> questions, {int? seed}) {
    return List<Question>.from(questions);
  }
}

Future<void> pumpQuizScreen(
  WidgetTester tester, {
  required List<Question> questions,
  QuizController Function(QuestionRepository repository)? overrideController,
}) async {
  final repository = FakeQuestionRepository(questions);
  final randomizer = const IdentityRandomizer();

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        questionRepositoryProvider.overrideWithValue(repository),
        questionRandomizerProvider.overrideWithValue(randomizer),
        if (overrideController != null)
          quizControllerProvider.overrideWith((ref) {
            return overrideController(repository);
          }),
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: SafeArea(child: QuizScreen()),
        ),
      ),
    ),
  );

  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
}

void main() {
  testWidgets('allows selecting an option and submitting a correct answer',
      (WidgetTester tester) async {
    await pumpQuizScreen(
      tester,
      questions: [
        buildQuestion(id: 1, correctIndex: 1, questionText: 'What is 2 + 2?'),
      ],
    );

    await tester.tap(find.text('Option B'));
    await tester.pump();

    final submit =
        tester.widget<ElevatedButton>(find.byKey(const Key('submitButton')));
    expect(submit.onPressed, isNotNull);

    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump();

    expect(find.textContaining('Great job!'), findsOneWidget);

    final next =
        tester.widget<OutlinedButton>(find.byKey(const Key('nextButton')));
    expect(next.onPressed, isNotNull);
  });

  testWidgets('auto timeout submits and shows explanation',
      (WidgetTester tester) async {
    await pumpQuizScreen(
      tester,
      questions: [
        buildQuestion(id: 1, correctIndex: 0, questionText: 'Timeout test?'),
      ],
      overrideController: (repository) => QuizController(
        repository: repository,
        randomizer: const IdentityRandomizer(),
        questionDuration: const Duration(milliseconds: 200),
        tickInterval: const Duration(milliseconds: 20),
      ),
    );

    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    expect(find.textContaining('Here’s the explanation'), findsOneWidget);
    final submit =
        tester.widget<ElevatedButton>(find.byKey(const Key('submitButton')));
    expect(submit.onPressed, isNull);
  });

  testWidgets('shows streak toast after consecutive correct answers',
      (WidgetTester tester) async {
    await pumpQuizScreen(
      tester,
      questions: [
        buildQuestion(id: 1, correctIndex: 0, questionText: 'Q1'),
        buildQuestion(id: 2, correctIndex: 0, questionText: 'Q2'),
        buildQuestion(id: 3, correctIndex: 0, questionText: 'Q3'),
      ],
    );

    for (var i = 0; i < 3; i++) {
      await tester.tap(find.text('Option A'));
      await tester.pump();
      await tester.tap(find.byKey(const Key('submitButton')));
      await tester.pump();
      if (i < 2) {
        await tester.tap(find.byKey(const Key('nextButton')));
        await tester.pump();
      }
    }

    expect(find.textContaining('Nice work!'), findsOneWidget);
  });
}

