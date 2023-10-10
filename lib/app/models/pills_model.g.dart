// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pills_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PillsModelAdapter extends TypeAdapter<PillsModel> {
  @override
  final int typeId = 1;

  @override
  PillsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PillsModel(
      id: fields[0] as int,
      text: fields[1] as String,
      background: fields[2] as int,
      isLottie: fields[3] as bool,
      createDate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PillsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.background)
      ..writeByte(3)
      ..write(obj.isLottie)
      ..writeByte(4)
      ..write(obj.createDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PillsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
