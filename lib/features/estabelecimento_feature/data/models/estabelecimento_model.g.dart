// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estabelecimento_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EstabelecimentoModelAdapter extends TypeAdapter<EstabelecimentoModel> {
  @override
  final int typeId = 0;

  @override
  EstabelecimentoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EstabelecimentoModel(
      companyId: fields[0] as int,
      companyName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EstabelecimentoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.companyId)
      ..writeByte(1)
      ..write(obj.companyName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstabelecimentoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
