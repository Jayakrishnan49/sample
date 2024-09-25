// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_base.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataBaseAdapter extends TypeAdapter<DataBase> {
  @override
  final int typeId = 0;

  @override
  DataBase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataBase(
      id: fields[0] as int?,
      userName: fields[1] as String,
      passWord: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataBase obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.passWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataBaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
