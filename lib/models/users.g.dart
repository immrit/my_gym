// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersAdapter extends TypeAdapter<Users> {
  @override
  final int typeId = 0;

  @override
  Users read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Users(
      id: fields[0] as int,
      name: fields[1] as String,
      nationalCode: fields[2] as String,
      fatherName: fields[3] as String,
      date: fields[4] as String,
      gender: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Users obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nationalCode)
      ..writeByte(3)
      ..write(obj.fatherName)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
