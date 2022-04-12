import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Coordenada extends Equatable {
  @HiveField(0)
  final int dispositivoId;
  @HiveField(1)
  final int sensorId;
  @HiveField(2)
  final DateTime data;
  @HiveField(3)
  final double latitude;
  @HiveField(4)
  final double longitude;
  @HiveField(5)
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
