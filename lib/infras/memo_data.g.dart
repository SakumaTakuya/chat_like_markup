// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoInHiveAdapter extends TypeAdapter<MemoInHive> {
  @override
  final int typeId = 1;

  @override
  MemoInHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoInHive()
      ..key = fields[0] as int
      ..dateTime = fields[1] as DateTime
      ..text = fields[2] as String
      ..title = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, MemoInHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoInHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
