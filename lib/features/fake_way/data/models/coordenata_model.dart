import 'dart:convert';

import 'package:fake_way/features/fake_way/domain/entities/coordenada_entity.dart';

class CoordenadaModel extends Coordenada {
  const CoordenadaModel(
      {required int dispositivoId,
      required int sensorId,
      required DateTime data,
      required double latitude,
      required double longitude,
      required double velocidade})
      : super(
            dispositivoId: dispositivoId,
            sensorId: sensorId,
            data: data,
            latitude: latitude,
            longitude: longitude,
            velocidade: velocidade);

  factory CoordenadaModel.fromJson(Map<String, dynamic> json) =>
      CoordenadaModel(
          dispositivoId: json["deviceId"],
          sensorId: json["sensorId"],
          data: DateTime.parse(json["readAt"].toString()),
          latitude: json["latitude"],
          longitude: json["longitude"],
          velocidade: json["speed"]);

  Map<String, dynamic> toMap() => {
        "deviceId": dispositivoId,
        "sensorId": sensorId,
        "readAt": data.toString(),
        "latitude": latitude,
        "longitude": longitude,
        "speed": velocidade
      };

  String toJson() => jsonEncode(toMap());
}
