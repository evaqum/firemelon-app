import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'password.freezed.dart';
part 'password.g.dart';

@freezed
class SavedPassword extends HiveObject with _$SavedPassword {
  static const boxName = 'passwords';
  static final adapter = SavedPasswordAdapter();

  SavedPassword._();

  @HiveType(typeId: 0, adapterName: 'SavedPasswordAdapter')
  factory SavedPassword({
    @HiveField(0) required String password,
    @HiveField(1) required String title,
  }) = _SavedPassword;
}
