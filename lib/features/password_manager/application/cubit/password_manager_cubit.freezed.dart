// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordManagerState {
  List<SavedPassword> get savedPasswords => throw _privateConstructorUsedError;
  SavedPassword? get lastDeletedPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordManagerStateCopyWith<PasswordManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordManagerStateCopyWith<$Res> {
  factory $PasswordManagerStateCopyWith(PasswordManagerState value,
          $Res Function(PasswordManagerState) then) =
      _$PasswordManagerStateCopyWithImpl<$Res>;
  $Res call(
      {List<SavedPassword> savedPasswords, SavedPassword? lastDeletedPassword});

  $SavedPasswordCopyWith<$Res>? get lastDeletedPassword;
}

/// @nodoc
class _$PasswordManagerStateCopyWithImpl<$Res>
    implements $PasswordManagerStateCopyWith<$Res> {
  _$PasswordManagerStateCopyWithImpl(this._value, this._then);

  final PasswordManagerState _value;
  // ignore: unused_field
  final $Res Function(PasswordManagerState) _then;

  @override
  $Res call({
    Object? savedPasswords = freezed,
    Object? lastDeletedPassword = freezed,
  }) {
    return _then(_value.copyWith(
      savedPasswords: savedPasswords == freezed
          ? _value.savedPasswords
          : savedPasswords // ignore: cast_nullable_to_non_nullable
              as List<SavedPassword>,
      lastDeletedPassword: lastDeletedPassword == freezed
          ? _value.lastDeletedPassword
          : lastDeletedPassword // ignore: cast_nullable_to_non_nullable
              as SavedPassword?,
    ));
  }

  @override
  $SavedPasswordCopyWith<$Res>? get lastDeletedPassword {
    if (_value.lastDeletedPassword == null) {
      return null;
    }

    return $SavedPasswordCopyWith<$Res>(_value.lastDeletedPassword!, (value) {
      return _then(_value.copyWith(lastDeletedPassword: value));
    });
  }
}

/// @nodoc
abstract class _$$_PasswordManagerStateCopyWith<$Res>
    implements $PasswordManagerStateCopyWith<$Res> {
  factory _$$_PasswordManagerStateCopyWith(_$_PasswordManagerState value,
          $Res Function(_$_PasswordManagerState) then) =
      __$$_PasswordManagerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SavedPassword> savedPasswords, SavedPassword? lastDeletedPassword});

  @override
  $SavedPasswordCopyWith<$Res>? get lastDeletedPassword;
}

/// @nodoc
class __$$_PasswordManagerStateCopyWithImpl<$Res>
    extends _$PasswordManagerStateCopyWithImpl<$Res>
    implements _$$_PasswordManagerStateCopyWith<$Res> {
  __$$_PasswordManagerStateCopyWithImpl(_$_PasswordManagerState _value,
      $Res Function(_$_PasswordManagerState) _then)
      : super(_value, (v) => _then(v as _$_PasswordManagerState));

  @override
  _$_PasswordManagerState get _value => super._value as _$_PasswordManagerState;

  @override
  $Res call({
    Object? savedPasswords = freezed,
    Object? lastDeletedPassword = freezed,
  }) {
    return _then(_$_PasswordManagerState(
      savedPasswords: savedPasswords == freezed
          ? _value._savedPasswords
          : savedPasswords // ignore: cast_nullable_to_non_nullable
              as List<SavedPassword>,
      lastDeletedPassword: lastDeletedPassword == freezed
          ? _value.lastDeletedPassword
          : lastDeletedPassword // ignore: cast_nullable_to_non_nullable
              as SavedPassword?,
    ));
  }
}

/// @nodoc

class _$_PasswordManagerState implements _PasswordManagerState {
  const _$_PasswordManagerState(
      {required final List<SavedPassword> savedPasswords,
      required this.lastDeletedPassword})
      : _savedPasswords = savedPasswords;

  final List<SavedPassword> _savedPasswords;
  @override
  List<SavedPassword> get savedPasswords {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedPasswords);
  }

  @override
  final SavedPassword? lastDeletedPassword;

  @override
  String toString() {
    return 'PasswordManagerState(savedPasswords: $savedPasswords, lastDeletedPassword: $lastDeletedPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordManagerState &&
            const DeepCollectionEquality()
                .equals(other._savedPasswords, _savedPasswords) &&
            const DeepCollectionEquality()
                .equals(other.lastDeletedPassword, lastDeletedPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_savedPasswords),
      const DeepCollectionEquality().hash(lastDeletedPassword));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordManagerStateCopyWith<_$_PasswordManagerState> get copyWith =>
      __$$_PasswordManagerStateCopyWithImpl<_$_PasswordManagerState>(
          this, _$identity);
}

abstract class _PasswordManagerState implements PasswordManagerState {
  const factory _PasswordManagerState(
          {required final List<SavedPassword> savedPasswords,
          required final SavedPassword? lastDeletedPassword}) =
      _$_PasswordManagerState;

  @override
  List<SavedPassword> get savedPasswords;
  @override
  SavedPassword? get lastDeletedPassword;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordManagerStateCopyWith<_$_PasswordManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}
