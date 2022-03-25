import 'package:equatable/equatable.dart';

class Coordenada extends Equatable {
  final int dispositivoId;
  final int sensorId;
  final DateTime data;
  final double latitude;
  final double longitude;
  final double velocidade;

  const Coordenada({
    required this.dispositivoId,
    required this.sensorId,
    required this.data,
    required this.latitude,
    required this.longitude,
    required this.velocidade,
  });

  @override
  List<Object?> get props =>
      [dispositivoId, sensorId, data, latitude, longitude, velocidade];
}
