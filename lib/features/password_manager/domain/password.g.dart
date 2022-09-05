// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedPasswordAdapter extends TypeAdapter<_$_SavedPassword> {
  @override
  final int typeId = 0;

  @override
  _$_SavedPassword read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_SavedPassword(
      password: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_SavedPassword obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.password)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedPasswordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
