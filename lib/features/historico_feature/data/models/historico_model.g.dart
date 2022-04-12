// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoricoModelAdapter extends TypeAdapter<HistoricoModel> {
  @override
  final int typeId = 1;

  @override
  HistoricoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoricoModel(
      ativo: fields[0] as Ativo,
      type: fields[1] as String,
      temperatura: fields[2] as Temperatura?,
      umidade: fields[3] as Umidade?,
      coordenada: fields[4] as Coordenada?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoricoModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ativo)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.temperatura)
      ..writeByte(3)
      ..write(obj.umidade)
      ..writeByte(4)
      ..write(obj.coordenada);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoricoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
