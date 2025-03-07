// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterModelAdapter extends TypeAdapter<CounterModel> {
  @override
  final int typeId = 0;

  @override
  CounterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterModel(
      id: fields[0] as String,
      isPinned: fields[1] as bool,
      counter_value: fields[2] as int,
      counter_range_value: fields[3] as int,
      title: fields[4] as String,
      description: fields[5] as String,
      isEdited_now: fields[6] as bool,
      dateadded: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CounterModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isPinned)
      ..writeByte(2)
      ..write(obj.counter_value)
      ..writeByte(3)
      ..write(obj.counter_range_value)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.isEdited_now)
      ..writeByte(7)
      ..write(obj.dateadded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
