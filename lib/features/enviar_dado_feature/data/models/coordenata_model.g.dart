// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordenata_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoordenadaModelAdapter extends TypeAdapter<CoordenadaModel> {
  @override
  final int typeId = 3;

  @override
  CoordenadaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoordenadaModel(
      dispositivoId: fields[0] as int,
      sensorId: fields[1] as int,
      data: fields[2] as DateTime,
      latitude: fields[3] as double,
      longitude: fields[4] as double,
      velocidade: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CoordenadaModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.dispositivoId)
      ..writeByte(1)
      ..write(obj.sensorId)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.latitude)
      ..writeByte(4)
      ..write(obj.longitude)
      ..writeByte(5)
      ..write(obj.velocidade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordenadaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
