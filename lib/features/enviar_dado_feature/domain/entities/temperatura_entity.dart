import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Temperatura extends Equatable {
  @HiveField(0)
  final int dispositivoId;
  @HiveField(1)
  final int sensorId;
  @HiveField(2)
  final DateTime data;
  @HiveField(3)
  final double temperatura;

  const Temperatura(
      {required this.dispositivoId,
      required this.sensorId,
      required this.data,
      required this.temperatura});

  @override
  List<Object?> get props => [dispositivoId, sensorId, data, temperatura];
}
