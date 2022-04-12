// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ativo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AtivoModelAdapter extends TypeAdapter<AtivoModel> {
  @override
  final int typeId = 2;

  @override
  AtivoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AtivoModel(
      estabelecimento: fields[0] as Estabelecimento,
      sensorId: fields[1] as int,
      dispotividoId: fields[2] as int,
      nome: fields[3] as String?,
      tipoId: fields[4] as int,
      tipoDescricao: fields[5] as String?,
      icone: fields[6] as String?,
      sensores: (fields[7] as List?)?.cast<String>(),
      latitude: fields[8] as double?,
      longitude: fields[9] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, AtivoModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.estabelecimento)
      ..writeByte(1)
      ..write(obj.sensorId)
      ..writeByte(2)
      ..write(obj.dispotividoId)
      ..writeByte(3)
      ..write(obj.nome)
      ..writeByte(4)
      ..write(obj.tipoId)
      ..writeByte(5)
      ..write(obj.tipoDescricao)
      ..writeByte(6)
      ..write(obj.icone)
      ..writeByte(7)
      ..write(obj.sensores)
      ..writeByte(8)
      ..write(obj.latitude)
      ..writeByte(9)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AtivoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
