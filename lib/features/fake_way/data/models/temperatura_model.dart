import 'dart:convert';

import 'package:fake_way/features/fake_way/domain/entities/temperatura_entity.dart';

class TemperaturaModel extends Temperatura {
  const TemperaturaModel(
      {required int dispositivoId,
      required int sensorId,
      required DateTime data,
      required double temperatura})
      : super(
            dispositivoId: dispositivoId,
            sensorId: sensorId,
            data: data,
            temperatura: temperatura);

  factory TemperaturaModel.fromJson(Map<String, dynamic> json) =>
      TemperaturaModel(
          dispositivoId: json["deviceId"],
          sensorId: json["sensorId"],
          data: DateTime.parse(json["readAt"].toString()),
          temperatura: json["temperature"]);

  Map<String, dynamic> toMap() => {
        "deviceId": dispositivoId,
        "sensorId": sensorId,
        "readAt": data.toIso8601String(),
        "temperature": temperatura
      };

  String toJson() => jsonEncode(toMap());
}
