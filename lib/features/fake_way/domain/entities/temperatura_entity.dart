import 'package:equatable/equatable.dart';

class Temperatura extends Equatable {
  final int dispositivoId;
  final int sensorId;
  final DateTime data;
  final double temperatura;

  Temperatura(
      {required this.dispositivoId,
      required this.sensorId,
      required this.data,
      required this.temperatura});

  @override
  List<Object?> get props => [dispositivoId, sensorId, data, temperatura];
}
