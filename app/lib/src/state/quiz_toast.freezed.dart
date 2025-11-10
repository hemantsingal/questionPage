// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_toast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizToast {
  int get id => throw _privateConstructorUsedError;
  QuizToastType get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of QuizToast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizToastCopyWith<QuizToast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizToastCopyWith<$Res> {
  factory $QuizToastCopyWith(QuizToast value, $Res Function(QuizToast) then) =
      _$QuizToastCopyWithImpl<$Res, QuizToast>;
  @useResult
  $Res call({int id, QuizToastType type, String message});
}

/// @nodoc
class _$QuizToastCopyWithImpl<$Res, $Val extends QuizToast>
    implements $QuizToastCopyWith<$Res> {
  _$QuizToastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizToast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuizToastType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizToastImplCopyWith<$Res>
    implements $QuizToastCopyWith<$Res> {
  factory _$$QuizToastImplCopyWith(
          _$QuizToastImpl value, $Res Function(_$QuizToastImpl) then) =
      __$$QuizToastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, QuizToastType type, String message});
}

/// @nodoc
class __$$QuizToastImplCopyWithImpl<$Res>
    extends _$QuizToastCopyWithImpl<$Res, _$QuizToastImpl>
    implements _$$QuizToastImplCopyWith<$Res> {
  __$$QuizToastImplCopyWithImpl(
      _$QuizToastImpl _value, $Res Function(_$QuizToastImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizToast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_$QuizToastImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuizToastType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuizToastImpl implements _QuizToast {
  const _$QuizToastImpl(
      {required this.id, required this.type, required this.message});

  @override
  final int id;
  @override
  final QuizToastType type;
  @override
  final String message;

  @override
  String toString() {
    return 'QuizToast(id: $id, type: $type, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizToastImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type, message);

  /// Create a copy of QuizToast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizToastImplCopyWith<_$QuizToastImpl> get copyWith =>
      __$$QuizToastImplCopyWithImpl<_$QuizToastImpl>(this, _$identity);
}

abstract class _QuizToast implements QuizToast {
  const factory _QuizToast(
      {required final int id,
      required final QuizToastType type,
      required final String message}) = _$QuizToastImpl;

  @override
  int get id;
  @override
  QuizToastType get type;
  @override
  String get message;

  /// Create a copy of QuizToast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizToastImplCopyWith<_$QuizToastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
