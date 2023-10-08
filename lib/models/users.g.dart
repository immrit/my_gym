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
      id: fields[1] as int,
      name: fields[2] as String,
      nationalCode: fields[3] as String,
      fatherName: fields[4] as String,
      date: fields[5] as String,
      gender: fields[6] as bool,
      amount: fields[7] as String,
      payment_method: fields[8] as bool,
      coach: fields[9] as String,
      field: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Users obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.nationalCode)
      ..writeByte(4)
      ..write(obj.fatherName)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.amount)
      ..writeByte(8)
      ..write(obj.payment_method)
      ..writeByte(9)
      ..write(obj.coach)
      ..writeByte(10)
      ..write(obj.field);
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
