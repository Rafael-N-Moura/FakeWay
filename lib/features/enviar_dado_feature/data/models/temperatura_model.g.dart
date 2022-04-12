// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperatura_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemperaturaModelAdapter extends TypeAdapter<TemperaturaModel> {
  @override
  final int typeId = 4;

  @override
  TemperaturaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemperaturaModel(
      dispositivoId: fields[0] as int,
      sensorId: fields[1] as int,
      data: fields[2] as DateTime,
      temperatura: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TemperaturaModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dispositivoId)
      ..writeByte(1)
      ..write(obj.sensorId)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.temperatura);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemperaturaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
