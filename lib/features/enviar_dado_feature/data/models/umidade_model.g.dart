// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'umidade_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UmidadeModelAdapter extends TypeAdapter<UmidadeModel> {
  @override
  final int typeId = 5;

  @override
  UmidadeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UmidadeModel(
      dispositivoId: fields[0] as int,
      sensorId: fields[1] as int,
      data: fields[2] as DateTime,
      umidade: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, UmidadeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dispositivoId)
      ..writeByte(1)
      ..write(obj.sensorId)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.umidade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UmidadeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
