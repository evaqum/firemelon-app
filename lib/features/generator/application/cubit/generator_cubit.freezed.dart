// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'generator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GeneratorState {
  String? get currentPassword => throw _privateConstructorUsedError;
  String? get lastCopied => throw _privateConstructorUsedError;
  int get complexity => throw _privateConstructorUsedError;
  bool get addNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeneratorStateCopyWith<GeneratorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratorStateCopyWith<$Res> {
  factory $GeneratorStateCopyWith(
          GeneratorState value, $Res Function(GeneratorState) then) =
      _$GeneratorStateCopyWithImpl<$Res>;
  $Res call(
      {String? currentPassword,
      String? lastCopied,
      int complexity,
      bool addNumber});
}

/// @nodoc
class _$GeneratorStateCopyWithImpl<$Res>
    implements $GeneratorStateCopyWith<$Res> {
  _$GeneratorStateCopyWithImpl(this._value, this._then);

  final GeneratorState _value;
  // ignore: unused_field
  final $Res Function(GeneratorState) _then;

  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? lastCopied = freezed,
    Object? complexity = freezed,
    Object? addNumber = freezed,
  }) {
    return _then(_value.copyWith(
      currentPassword: currentPassword == freezed
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCopied: lastCopied == freezed
          ? _value.lastCopied
          : lastCopied // ignore: cast_nullable_to_non_nullable
              as String?,
      complexity: complexity == freezed
          ? _value.complexity
          : complexity // ignore: cast_nullable_to_non_nullable
              as int,
      addNumber: addNumber == freezed
          ? _value.addNumber
          : addNumber // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_GeneratorStateCopyWith<$Res>
    implements $GeneratorStateCopyWith<$Res> {
  factory _$$_GeneratorStateCopyWith(
          _$_GeneratorState value, $Res Function(_$_GeneratorState) then) =
      __$$_GeneratorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? currentPassword,
      String? lastCopied,
      int complexity,
      bool addNumber});
}

/// @nodoc
class __$$_GeneratorStateCopyWithImpl<$Res>
    extends _$GeneratorStateCopyWithImpl<$Res>
    implements _$$_GeneratorStateCopyWith<$Res> {
  __$$_GeneratorStateCopyWithImpl(
      _$_GeneratorState _value, $Res Function(_$_GeneratorState) _then)
      : super(_value, (v) => _then(v as _$_GeneratorState));

  @override
  _$_GeneratorState get _value => super._value as _$_GeneratorState;

  @override
  $Res call({
    Object? currentPassword = freezed,
    Object? lastCopied = freezed,
    Object? complexity = freezed,
    Object? addNumber = freezed,
  }) {
    return _then(_$_GeneratorState(
      currentPassword: currentPassword == freezed
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCopied: lastCopied == freezed
          ? _value.lastCopied
          : lastCopied // ignore: cast_nullable_to_non_nullable
              as String?,
      complexity: complexity == freezed
          ? _value.complexity
          : complexity // ignore: cast_nullable_to_non_nullable
              as int,
      addNumber: addNumber == freezed
          ? _value.addNumber
          : addNumber // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GeneratorState implements _GeneratorState {
  const _$_GeneratorState(
      {required this.currentPassword,
      required this.lastCopied,
      required this.complexity,
      required this.addNumber});

  @override
  final String? currentPassword;
  @override
  final String? lastCopied;
  @override
  final int complexity;
  @override
  final bool addNumber;

  @override
  String toString() {
    return 'GeneratorState(currentPassword: $currentPassword, lastCopied: $lastCopied, complexity: $complexity, addNumber: $addNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneratorState &&
            const DeepCollectionEquality()
                .equals(other.currentPassword, currentPassword) &&
            const DeepCollectionEquality()
                .equals(other.lastCopied, lastCopied) &&
            const DeepCollectionEquality()
                .equals(other.complexity, complexity) &&
            const DeepCollectionEquality().equals(other.addNumber, addNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentPassword),
      const DeepCollectionEquality().hash(lastCopied),
      const DeepCollectionEquality().hash(complexity),
      const DeepCollectionEquality().hash(addNumber));

  @JsonKey(ignore: true)
  @override
  _$$_GeneratorStateCopyWith<_$_GeneratorState> get copyWith =>
      __$$_GeneratorStateCopyWithImpl<_$_GeneratorState>(this, _$identity);
}

abstract class _GeneratorState implements GeneratorState {
  const factory _GeneratorState(
      {required final String? currentPassword,
      required final String? lastCopied,
      required final int complexity,
      required final bool addNumber}) = _$_GeneratorState;

  @override
  String? get currentPassword;
  @override
  String? get lastCopied;
  @override
  int get complexity;
  @override
  bool get addNumber;
  @override
  @JsonKey(ignore: true)
  _$$_GeneratorStateCopyWith<_$_GeneratorState> get copyWith =>
      throw _privateConstructorUsedError;
}
