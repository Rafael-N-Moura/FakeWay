import 'package:fake_way/features/estabelecimento_feature/data/models/estabelecimento_model.dart';
import 'package:fake_way/features/ativo_feature/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:hive/hive.dart';

part 'ativo_model.g.dart';

@HiveType(typeId: 2)
class AtivoModel extends Ativo {
  const AtivoModel(
      {required Estabelecimento estabelecimento,
      required int sensorId,
      required int dispotividoId,
      required String? nome,
      required int tipoId,
      required String? tipoDescricao,
      required String? icone,
      required List<String>? sensores,
      required double? latitude,
      required double? longitude})
      : super(
          estabelecimento: estabelecimento,
          sensorId: sensorId,
          dispotividoId: dispotividoId,
          nome: nome,
          tipoId: tipoId,
          tipoDescricao: tipoDescricao,
          icone: icone,
          sensores: sensores,
          latitude: latitude,
          longitude: longitude,
        );

  factory AtivoModel.fromJson(Map<String, dynamic> json) {
    return AtivoModel(
      estabelecimento: EstabelecimentoModel.fromJson(json),
      sensorId: json['sensorId'],
      dispotividoId: json['deviceId'],
      nome: json['name'],
      tipoId: json['typeId'],
      tipoDescricao: json['typeDescription'],
      icone: json['icon'],
      sensores: List<String>.from(json['sensors']),
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
