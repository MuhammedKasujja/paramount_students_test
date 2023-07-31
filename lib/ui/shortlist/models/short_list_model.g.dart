// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShortListModelAdapter extends TypeAdapter<ShortListModel> {
  @override
  final int typeId = 0;

  @override
  ShortListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShortListModel(
      id: fields[0] as String,
      dept: fields[1] as String,
      university: fields[2] as String,
      univeristyLocation: fields[3] as String,
      amount: fields[4] as int,
      date: fields[5] as String,
      programId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShortListModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dept)
      ..writeByte(2)
      ..write(obj.university)
      ..writeByte(3)
      ..write(obj.univeristyLocation)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.programId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
