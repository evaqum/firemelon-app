// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedPassword {
  @HiveField(0)
  String get password => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedPasswordCopyWith<SavedPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPasswordCopyWith<$Res> {
  factory $SavedPasswordCopyWith(
          SavedPassword value, $Res Function(SavedPassword) then) =
      _$SavedPasswordCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String password, @HiveField(1) String title});
}

/// @nodoc
class _$SavedPasswordCopyWithImpl<$Res>
    implements $SavedPasswordCopyWith<$Res> {
  _$SavedPasswordCopyWithImpl(this._value, this._then);

  final SavedPassword _value;
  // ignore: unused_field
  final $Res Function(SavedPassword) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SavedPasswordCopyWith<$Res>
    implements $SavedPasswordCopyWith<$Res> {
  factory _$$_SavedPasswordCopyWith(
          _$_SavedPassword value, $Res Function(_$_SavedPassword) then) =
      __$$_SavedPasswordCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String password, @HiveField(1) String title});
}

/// @nodoc
class __$$_SavedPasswordCopyWithImpl<$Res>
    extends _$SavedPasswordCopyWithImpl<$Res>
    implements _$$_SavedPasswordCopyWith<$Res> {
  __$$_SavedPasswordCopyWithImpl(
      _$_SavedPassword _value, $Res Function(_$_SavedPassword) _then)
      : super(_value, (v) => _then(v as _$_SavedPassword));

  @override
  _$_SavedPassword get _value => super._value as _$_SavedPassword;

  @override
  $Res call({
    Object? password = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_SavedPassword(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: 'SavedPasswordAdapter')
class _$_SavedPassword extends _SavedPassword {
  _$_SavedPassword(
      {@HiveField(0) required this.password, @HiveField(1) required this.title})
      : super._();

  @override
  @HiveField(0)
  final String password;
  @override
  @HiveField(1)
  final String title;

  @override
  String toString() {
    return 'SavedPassword(password: $password, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedPassword &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_SavedPasswordCopyWith<_$_SavedPassword> get copyWith =>
      __$$_SavedPasswordCopyWithImpl<_$_SavedPassword>(this, _$identity);
}

abstract class _SavedPassword extends SavedPassword {
  factory _SavedPassword(
      {@HiveField(0) required final String password,
      @HiveField(1) required final String title}) = _$_SavedPassword;
  _SavedPassword._() : super._();

  @override
  @HiveField(0)
  String get password;
  @override
  @HiveField(1)
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_SavedPasswordCopyWith<_$_SavedPassword> get copyWith =>
      throw _privateConstructorUsedError;
}
