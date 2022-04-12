import 'dart:convert';

import 'package:hive/hive.dart';

import '../../domain/entities/umidade_entity.dart';

part 'umidade_model.g.dart';

@HiveType(typeId: 5)
class UmidadeModel extends Umidade {
  const UmidadeModel(
      {required int dispositivoId,
      required int sensorId,
      required DateTime data,
      required double umidade})
      : super(
            dispositivoId: dispositivoId,
            sensorId: sensorId,
            data: data,
            umidade: umidade);

  factory UmidadeModel.fromJson(Map<String, dynamic> json) => UmidadeModel(
      dispositivoId: json["deviceId"],
      sensorId: json["sensorId"],
      data: DateTime.parse(json["readAt"].toString()),
      umidade: json["humidity"]);

  Map<String, dynamic> toMap() => {
        "deviceId": dispositivoId,
        "sensorId": sensorId,
        "readAt": data.toIso8601String(),
        "humidity": umidade
      };

  String toJson() => jsonEncode(toMap());
}
