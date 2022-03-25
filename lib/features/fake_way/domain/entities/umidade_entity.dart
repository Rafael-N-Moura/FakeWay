import 'package:equatable/equatable.dart';

class Umidade extends Equatable {
  final int dispositivoId;
  final int sensorId;
  final DateTime data;
  final double umidade;
  const Umidade({
    required this.dispositivoId,
    required this.sensorId,
    required this.data,
    required this.umidade,
  });

  @override
  List<Object?> get props => [dispositivoId, sensorId, data, umidade];
}
