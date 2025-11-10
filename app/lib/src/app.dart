import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/question_repository.dart';
import 'models/models.dart';
import 'services/question_randomizer.dart';

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  return QuestionRepository();
});

final questionRandomizerProvider = Provider<QuestionRandomizer>((ref) {
  return const QuestionRandomizer();
});

final questionsProvider = FutureProvider<List<Question>>((ref) async {
  final repository = ref.watch(questionRepositoryProvider);
  final randomizer = ref.watch(questionRandomizerProvider);
  final questions = await repository.fetchQuestions();
  return randomizer.shuffle(questions);
});

class QuizApp extends ConsumerWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionsProvider);

    return MaterialApp(
      title: 'Quiz Module Prototype',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Module Prototype'),
        ),
        body: Center(
          child: questions.when(
            data: (questionList) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.task_alt, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Questions loaded: ${questionList.length}',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Phase 0 placeholder screen.\nFull quiz experience coming soon.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load questions.\n$error',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Theme.of(context).colorScheme.error),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

