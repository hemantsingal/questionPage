Plan: Flutter MCQ Quiz Module
================================

1. Clarified Decisions & Remaining Questions
--------------------------------
- Award a flat 100 XP for each correct answer; no multipliers or legacy model tie-ins required.
- XP and streak state can remain in-memory—no persistence needed beyond the current session.
- Auto-submit answers as incorrect when the 10-second timer expires.
- Show varied mentor toast messages (multiple copy variants) while a streak is active.
- When a streak breaks (incorrect or timed-out answer), display a specific toast/message acknowledging the reset.
- Review Mode exposes only completed questions with read-only explanations (no answer changes).
- Reshuffle the question order on every app launch; no need to persist the shuffled sequence.
- Timer length, XP, and toast messaging can be hard-coded for now.

2. Architecture Overview
-------------------------
- Flutter app structured with feature-oriented folders: `data`, `repositories`, `controllers` (Riverpod), `widgets`, `screens`, and `services`.
- Utilize Riverpod for reactive state: providers for question list, quiz progression, timer, XP/streak tracking, and Hive storage adapters.
- Implement a domain layer with plain Dart models (`Question`, `QuizProgress`, `XpState`) and pure logic services (`XpCalculator`, `QuestionRandomizer`).

3. Data & Models
-----------------
- Define Dart model classes generated via `freezed`/`json_serializable` for immutability and JSON parsing.
- Parse questions from `assets/questions.json` at startup; include loading error handling and fallback messaging.
- Add Hive type adapters for persisted entities: `QuizProgress` (current index, answered status, streak) and `XpState` (total XP, bonus metadata).
- Consider storing answered question history to support Review Mode and analytics.

4. Question Flow & Randomization
---------------------------------
- On initialization, shuffle question order for the session and keep a mapping for Review Mode reference.
- Maintain provider for current question index, with logic to handle last-question transitions to completion screen.
- No persistence needed for shuffled order or index; reshuffle on each new launch.

5. Timer & Timeout Handling
---------------------------
- Implement a per-question countdown (fixed 10 seconds) using Riverpod `StreamProvider` or `StateNotifier`.
- Provide timer UI (progress ring or bar); pause/resume on navigation events.
- When the timer hits zero, auto-submit as incorrect, surface feedback, and disable manual submission.
- Ensure transitions to the next question respect the timeout state and animations.

6. XP, Streaks & Mentor Feedback
---------------------------------
- Create `XpCalculator` that grants 100 XP per correct answer without multipliers.
- Track streak counters in-memory, resetting on incorrect or timed-out answers.
- Trigger mentor toasts with varied copy once the streak meets defined milestones (e.g., 3 consecutive correct answers).
- Decide on streak reset messaging (pending answer above) and coordinate toast lifecycle.
- Update UI with animated XP gains and toast overlay.

7. UI/UX Implementation
------------------------
- Build Material 3 compliant screens: `QuizScreen`, `FeedbackPanel`, `CompletionScreen`, `ReviewModeScreen`.
- Design components: question card, option tiles (with selectable state, disabled post-submit), progress bar, timer indicator.
- Provide immediate feedback by coloring options and showing explanation card with expand/collapse animations.
- Include accessibility considerations (semantics, high-contrast colors).

8. Persistence & Hive Integration
---------------------------------
- Initialize Hive in Flutter entrypoint; register adapters during app startup (focus on progress if needed later).
- With XP and streaks in-memory, persistence centers on minimal essentials (e.g., last question index if we later opt in).
- “Reset Progress” clears any stored quiz state (if introduced) and resets active providers.


9. Completion & Review Mode
----------------------------
- Completion screen summarizes total correct answers, total XP (with breakdown if needed), and offers `Retry` (clear state & reshuffle) plus `Review Mode`.
- Review Mode displays answered questions, selected answers, correctness, and explanations, allowing users to revisit learning points.
- Consider optional filter/sort within Review Mode (e.g., incorrect first).

10. Animations & Transitions
-----------------------------
- Apply fade or slide transitions between questions using `AnimatedSwitcher` or `PageTransitionSwitcher`.
- Animate progress bar updates and XP gain (e.g., counting up).
- Provide subtle animation for mentor toast appearance/disappearance.

11. Testing & QA Strategy
--------------------------
- Unit tests for `XpCalculator`, timer logic, progress persistence, and JSON parsing.
- Widget tests covering question rendering, feedback flow, and completion screen.
- Integration test simulating a full quiz session with Hive-backed persistence (using mock Hive or test adapters).
- Manual QA checklist for timer edge cases, app restart scenarios, and Review Mode navigation.

12. Milestones & Execution Order
---------------------------------
1. Finalize clarifications (open questions above) and confirm JSON schema.
2. Scaffold Flutter project structure, add dependencies: Riverpod, Freezed, Hive, animations.
3. Implement models and JSON parsing; load questions from asset.
4. Build state management providers for question progression and XP.
5. Implement quiz UI with selection, submission, and feedback.
6. Add XP/streak logic, timer bonus, and persistence via Hive.
7. Create completion and review modes, mentor toast, and reset flow.
8. Polish animations, accessibility, and Material 3 styling.
9. Write automated tests and run QA pass.
10. Prepare documentation (README update, usage guide) and deployment checklist.


13. Detailed Execution & Testing Plan
------------------------------------

Phase 0 – Project Setup ✅ Completed
- Tasks: Scaffold Flutter project structure, add dependencies (Riverpod, Freezed, Hive, animations, testing libs), configure analysis options, wire asset loading.
- Tests: Run `flutter test` baseline to ensure environment is green; add initial smoke widget test verifying app bootstraps without errors.

Phase 1 – Data Layer & Models ✅ Completed
- Tasks: Implement `Question` model with JSON parsing, optional DTOs; create Hive adapters if needed; build services for loading questions from assets and reshuffling.
- Tests: Unit tests for JSON parsing (valid/invalid cases), shuffling logic determinism, asset loading failure handling. Run coverage; ensure >90% for data layer.

Phase 2 – State Management (Riverpod) ✅ Completed
- Tasks: Create providers/notifiers for question list, current index, submission status, timer, XP/streak tracking; define actions for submit, next, reset, streak reset messaging.
- Tests: State unit tests for transitions (submit correct/wrong/timed out), timer countdown behavior, streak start/stop messaging, XP accumulation. Verified with automated suite (`flutter analyze`, `flutter test`).

Phase 3 – Core Quiz UI ✅ Completed
- Tasks: Build question screen widgets (question card, option list with selection/disable, submit/next buttons), integrate timer UI and auto-submit on expiry, feedback coloring and explanation panel.
- Tests: Widget tests covering selection + submit flow, timeout-driven auto-submit, toast feedback, and button states. Verified via `flutter test`.

Phase 4 – XP Feedback & Mentor Toasts
- Tasks: Implement XP animation, session XP summary, streak tracking visuals, varied mentor toast messages on streak milestones and specific reset message.
- Tests: Widget/state tests validating toast variants triggered at correct streak counts, reset messaging on failure, XP display accuracy. Include animation frame tests if feasible; ensure coverage remains near 100% for logic.

Phase 5 – Completion & Review Modes
- Tasks: Build completion screen (summary, retry, review entry), implement Review Mode listing completed questions with explanations-only view, ensure navigation flow and reset/reshuffle behavior.
- Tests: Integration/widget tests verifying completion metrics, retry reshuffle, review navigation, read-only behavior. Run end-to-end test simulating full quiz, verifying XP and streak messaging sequences.

Phase 6 – Persistence & Reset (Optional Scope)
- Tasks: If persistence is retained for progress, store minimal session progress in Hive; implement reset button to clear; ensure in-memory XP remains session-bound.
- Tests: Integration tests mocking Hive boxes to ensure state saves/loads correctly, reset clears as expected. Run entire suite post-changes.

Phase 7 – Animations, Accessibility & Polish
- Tasks: Apply Material 3 styling, add animated transitions (`AnimatedSwitcher`, progress bar), ensure semantics labels, keyboard navigation.
- Tests: Golden tests for key screens, accessibility unit checks (semantics tester), ensure animations don’t break logic tests. Run full suite and `flutter analyze`.

Phase 8 – Final QA & Documentation
- Tasks: Assemble QA checklist (timer edge cases, streak reset messaging, review read-only flow), update README with usage/testing instructions, prepare release notes.
- Tests: Execute full automated suite (unit, widget, integration, golden) and run manual checklist; gather coverage report to confirm near-100% on critical packages.
