import 'package:fake_way/features/fake_way/data/models/estabelecimento_model.dart';
import 'package:fake_way/features/fake_way/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/fake_way/domain/entities/estabelecimento_entity.dart';

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
      sensores: json['sensors'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
