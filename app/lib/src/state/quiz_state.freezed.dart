// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)
        active,
    required TResult Function(List<Question> questions, int totalXp,
            int correctCount, int incorrectCount, int finalStreakCount)
        completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)?
        active,
    TResult? Function(List<Question> questions, int totalXp, int correctCount,
            int incorrectCount, int finalStreakCount)?
        completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)?
        active,
    TResult Function(List<Question> questions, int totalXp, int correctCount,
            int incorrectCount, int finalStreakCount)?
        completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizStateLoading value) loading,
    required TResult Function(QuizStateActive value) active,
    required TResult Function(QuizStateCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizStateLoading value)? loading,
    TResult? Function(QuizStateActive value)? active,
    TResult? Function(QuizStateCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizStateLoading value)? loading,
    TResult Function(QuizStateActive value)? active,
    TResult Function(QuizStateCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res, QuizState>;
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$QuizStateLoadingImplCopyWith<$Res> {
  factory _$$QuizStateLoadingImplCopyWith(_$QuizStateLoadingImpl value,
          $Res Function(_$QuizStateLoadingImpl) then) =
      __$$QuizStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuizStateLoadingImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizStateLoadingImpl>
    implements _$$QuizStateLoadingImplCopyWith<$Res> {
  __$$QuizStateLoadingImplCopyWithImpl(_$QuizStateLoadingImpl _value,
      $Res Function(_$QuizStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$QuizStateLoadingImpl implements QuizStateLoading {
  const _$QuizStateLoadingImpl();

  @override
  String toString() {
    return 'QuizState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$QuizStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)
        active,
    required TResult Function(List<Question> questions, int totalXp,
            int correctCount, int incorrectCount, int finalStreakCount)
        completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)?
        active,
    TResult? Function(List<Question> questions, int totalXp, int correctCount,
            int incorrectCount, int finalStreakCount)?
        completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)?
        active,
    TResult Function(List<Question> questions, int totalXp, int correctCount,
            int incorrectCount, int finalStreakCount)?
        completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizStateLoading value) loading,
    required TResult Function(QuizStateActive value) active,
    required TResult Function(QuizStateCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizStateLoading value)? loading,
    TResult? Function(QuizStateActive value)? active,
    TResult? Function(QuizStateCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizStateLoading value)? loading,
    TResult Function(QuizStateActive value)? active,
    TResult Function(QuizStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class QuizStateLoading implements QuizState {
  const factory QuizStateLoading() = _$QuizStateLoadingImpl;
}

/// @nodoc
abstract class _$$QuizStateActiveImplCopyWith<$Res> {
  factory _$$QuizStateActiveImplCopyWith(_$QuizStateActiveImpl value,
          $Res Function(_$QuizStateActiveImpl) then) =
      __$$QuizStateActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Question> questions,
      int currentIndex,
      int? selectedOptionIndex,
      SubmissionStatus submissionStatus,
      int totalXp,
      int streakCount,
      int correctCount,
      int incorrectCount,
      QuizToast? activeToast,
      int durationSeconds,
      int secondsRemaining,
      bool isTimerRunning});

  $QuizToastCopyWith<$Res>? get activeToast;
}

/// @nodoc
class __$$QuizStateActiveImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizStateActiveImpl>
    implements _$$QuizStateActiveImplCopyWith<$Res> {
  __$$QuizStateActiveImplCopyWithImpl(
      _$QuizStateActiveImpl _value, $Res Function(_$QuizStateActiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? currentIndex = null,
    Object? selectedOptionIndex = freezed,
    Object? submissionStatus = null,
    Object? totalXp = null,
    Object? streakCount = null,
    Object? correctCount = null,
    Object? incorrectCount = null,
    Object? activeToast = freezed,
    Object? durationSeconds = null,
    Object? secondsRemaining = null,
    Object? isTimerRunning = null,
  }) {
    return _then(_$QuizStateActiveImpl(
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedOptionIndex: freezed == selectedOptionIndex
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      submissionStatus: null == submissionStatus
          ? _value.submissionStatus
          : submissionStatus // ignore: cast_nullable_to_non_nullable
              as SubmissionStatus,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      streakCount: null == streakCount
          ? _value.streakCount
          : streakCount // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      incorrectCount: null == incorrectCount
          ? _value.incorrectCount
          : incorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      activeToast: freezed == activeToast
          ? _value.activeToast
          : activeToast // ignore: cast_nullable_to_non_nullable
              as QuizToast?,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      secondsRemaining: null == secondsRemaining
          ? _value.secondsRemaining
          : secondsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      isTimerRunning: null == isTimerRunning
          ? _value.isTimerRunning
          : isTimerRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizToastCopyWith<$Res>? get activeToast {
    if (_value.activeToast == null) {
      return null;
    }

    return $QuizToastCopyWith<$Res>(_value.activeToast!, (value) {
      return _then(_value.copyWith(activeToast: value));
    });
  }
}

/// @nodoc

class _$QuizStateActiveImpl implements QuizStateActive {
  const _$QuizStateActiveImpl(
      {required final List<Question> questions,
      required this.currentIndex,
      this.selectedOptionIndex,
      this.submissionStatus = SubmissionStatus.pending,
      this.totalXp = 0,
      this.streakCount = 0,
      this.correctCount = 0,
      this.incorrectCount = 0,
      this.activeToast,
      this.durationSeconds = 10,
      this.secondsRemaining = 10,
      this.isTimerRunning = false})
      : _questions = questions;

  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final int currentIndex;
  @override
  final int? selectedOptionIndex;
  @override
  @JsonKey()
  final SubmissionStatus submissionStatus;
  @override
  @JsonKey()
  final int totalXp;
  @override
  @JsonKey()
  final int streakCount;
  @override
  @JsonKey()
  final int correctCount;
  @override
  @JsonKey()
  final int incorrectCount;
  @override
  final QuizToast? activeToast;
  @override
  @JsonKey()
  final int durationSeconds;
  @override
  @JsonKey()
  final int secondsRemaining;
  @override
  @JsonKey()
  final bool isTimerRunning;

  @override
  String toString() {
    return 'QuizState.active(questions: $questions, currentIndex: $currentIndex, selectedOptionIndex: $selectedOptionIndex, submissionStatus: $submissionStatus, totalXp: $totalXp, streakCount: $streakCount, correctCount: $correctCount, incorrectCount: $incorrectCount, activeToast: $activeToast, durationSeconds: $durationSeconds, secondsRemaining: $secondsRemaining, isTimerRunning: $isTimerRunning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStateActiveImpl &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.selectedOptionIndex, selectedOptionIndex) ||
                other.selectedOptionIndex == selectedOptionIndex) &&
            (identical(other.submissionStatus, submissionStatus) ||
                other.submissionStatus == submissionStatus) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.streakCount, streakCount) ||
                other.streakCount == streakCount) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.incorrectCount, incorrectCount) ||
                other.incorrectCount == incorrectCount) &&
            (identical(other.activeToast, activeToast) ||
                other.activeToast == activeToast) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.secondsRemaining, secondsRemaining) ||
                other.secondsRemaining == secondsRemaining) &&
            (identical(other.isTimerRunning, isTimerRunning) ||
                other.isTimerRunning == isTimerRunning));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questions),
      currentIndex,
      selectedOptionIndex,
      submissionStatus,
      totalXp,
      streakCount,
      correctCount,
      incorrectCount,
      activeToast,
      durationSeconds,
      secondsRemaining,
      isTimerRunning);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStateActiveImplCopyWith<_$QuizStateActiveImpl> get copyWith =>
      __$$QuizStateActiveImplCopyWithImpl<_$QuizStateActiveImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)
        active,
    required TResult Function(List<Question> questions, int totalXp,
            int correctCount, int incorrectCount, int finalStreakCount)
        completed,
  }) {
    return active(
        questions,
        currentIndex,
        selectedOptionIndex,
        submissionStatus,
        totalXp,
        streakCount,
        correctCount,
        incorrectCount,
        activeToast,
        durationSeconds,
        secondsRemaining,
        isTimerRunning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)?
        active,
    TResult? Function(List<Question> questions, int totalXp, int correctCount,
            int incorrectCount, int finalStreakCount)?
        completed,
  }) {
    return active?.call(
        questions,
        currentIndex,
        selectedOptionIndex,
        submissionStatus,
        totalXp,
        streakCount,
        correctCount,
        incorrectCount,
        activeToast,
        durationSeconds,
        secondsRemaining,
        isTimerRunning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)?
        active,
    TResult Function(List<Question> questions, int totalXp, int correctCount,
            int incorrectCount, int finalStreakCount)?
        completed,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(
          questions,
          currentIndex,
          selectedOptionIndex,
          submissionStatus,
          totalXp,
          streakCount,
          correctCount,
          incorrectCount,
          activeToast,
          durationSeconds,
          secondsRemaining,
          isTimerRunning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizStateLoading value) loading,
    required TResult Function(QuizStateActive value) active,
    required TResult Function(QuizStateCompleted value) completed,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizStateLoading value)? loading,
    TResult? Function(QuizStateActive value)? active,
    TResult? Function(QuizStateCompleted value)? completed,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizStateLoading value)? loading,
    TResult Function(QuizStateActive value)? active,
    TResult Function(QuizStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class QuizStateActive implements QuizState {
  const factory QuizStateActive(
      {required final List<Question> questions,
      required final int currentIndex,
      final int? selectedOptionIndex,
      final SubmissionStatus submissionStatus,
      final int totalXp,
      final int streakCount,
      final int correctCount,
      final int incorrectCount,
      final QuizToast? activeToast,
      final int durationSeconds,
      final int secondsRemaining,
      final bool isTimerRunning}) = _$QuizStateActiveImpl;

  List<Question> get questions;
  int get currentIndex;
  int? get selectedOptionIndex;
  SubmissionStatus get submissionStatus;
  int get totalXp;
  int get streakCount;
  int get correctCount;
  int get incorrectCount;
  QuizToast? get activeToast;
  int get durationSeconds;
  int get secondsRemaining;
  bool get isTimerRunning;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizStateActiveImplCopyWith<_$QuizStateActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuizStateCompletedImplCopyWith<$Res> {
  factory _$$QuizStateCompletedImplCopyWith(_$QuizStateCompletedImpl value,
          $Res Function(_$QuizStateCompletedImpl) then) =
      __$$QuizStateCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Question> questions,
      int totalXp,
      int correctCount,
      int incorrectCount,
      int finalStreakCount});
}

/// @nodoc
class __$$QuizStateCompletedImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizStateCompletedImpl>
    implements _$$QuizStateCompletedImplCopyWith<$Res> {
  __$$QuizStateCompletedImplCopyWithImpl(_$QuizStateCompletedImpl _value,
      $Res Function(_$QuizStateCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? totalXp = null,
    Object? correctCount = null,
    Object? incorrectCount = null,
    Object? finalStreakCount = null,
  }) {
    return _then(_$QuizStateCompletedImpl(
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      correctCount: null == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int,
      incorrectCount: null == incorrectCount
          ? _value.incorrectCount
          : incorrectCount // ignore: cast_nullable_to_non_nullable
              as int,
      finalStreakCount: null == finalStreakCount
          ? _value.finalStreakCount
          : finalStreakCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QuizStateCompletedImpl implements QuizStateCompleted {
  const _$QuizStateCompletedImpl(
      {required final List<Question> questions,
      required this.totalXp,
      required this.correctCount,
      required this.incorrectCount,
      required this.finalStreakCount})
      : _questions = questions;

  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final int totalXp;
  @override
  final int correctCount;
  @override
  final int incorrectCount;
  @override
  final int finalStreakCount;

  @override
  String toString() {
    return 'QuizState.completed(questions: $questions, totalXp: $totalXp, correctCount: $correctCount, incorrectCount: $incorrectCount, finalStreakCount: $finalStreakCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizStateCompletedImpl &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.incorrectCount, incorrectCount) ||
                other.incorrectCount == incorrectCount) &&
            (identical(other.finalStreakCount, finalStreakCount) ||
                other.finalStreakCount == finalStreakCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questions),
      totalXp,
      correctCount,
      incorrectCount,
      finalStreakCount);

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizStateCompletedImplCopyWith<_$QuizStateCompletedImpl> get copyWith =>
      __$$QuizStateCompletedImplCopyWithImpl<_$QuizStateCompletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)
        active,
    required TResult Function(List<Question> questions, int totalXp,
            int correctCount, int incorrectCount, int finalStreakCount)
        completed,
  }) {
    return completed(
        questions, totalXp, correctCount, incorrectCount, finalStreakCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)?
        active,
    TResult? Function(List<Question> questions, int totalXp, int correctCount,
            int incorrectCount, int finalStreakCount)?
        completed,
  }) {
    return completed?.call(
        questions, totalXp, correctCount, incorrectCount, finalStreakCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Question> questions,
            int currentIndex,
            int? selectedOptionIndex,
            SubmissionStatus submissionStatus,
            int totalXp,
            int streakCount,
            int correctCount,
            int incorrectCount,
            QuizToast? activeToast,
            int durationSeconds,
            int secondsRemaining,
            bool isTimerRunning)?
        active,
    TResult Function(List<Question> questions, int totalXp, int correctCount,
            int incorrectCount, int finalStreakCount)?
        completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(
          questions, totalXp, correctCount, incorrectCount, finalStreakCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizStateLoading value) loading,
    required TResult Function(QuizStateActive value) active,
    required TResult Function(QuizStateCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizStateLoading value)? loading,
    TResult? Function(QuizStateActive value)? active,
    TResult? Function(QuizStateCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizStateLoading value)? loading,
    TResult Function(QuizStateActive value)? active,
    TResult Function(QuizStateCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class QuizStateCompleted implements QuizState {
  const factory QuizStateCompleted(
      {required final List<Question> questions,
      required final int totalXp,
      required final int correctCount,
      required final int incorrectCount,
      required final int finalStreakCount}) = _$QuizStateCompletedImpl;

  List<Question> get questions;
  int get totalXp;
  int get correctCount;
  int get incorrectCount;
  int get finalStreakCount;

  /// Create a copy of QuizState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizStateCompletedImplCopyWith<_$QuizStateCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
