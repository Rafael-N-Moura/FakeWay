import 'package:equatable/equatable.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:hive/hive.dart';

class Ativo extends Equatable {
  @HiveField(0)
  final Estabelecimento estabelecimento;
  @HiveField(1)
  final int sensorId;
  @HiveField(2)
  final int dispotividoId;
  @HiveField(3)
  final String? nome;
  @HiveField(4)
  final int tipoId;
  @HiveField(5)
  final String? tipoDescricao;
  @HiveField(6)
  final String? icone;
  @HiveField(7)
  final List<String>? sensores;
  @HiveField(8)
  final double? latitude;
  @HiveField(9)
  final double? longitude;

  const Ativo(
      {required this.estabelecimento,
      required this.sensorId,
      required this.dispotividoId,
      required this.nome,
      required this.tipoId,
      required this.tipoDescricao,
      required this.icone,
      required this.sensores,
      required this.latitude,
      required this.longitude});

  @override
  List<Object?> get props => [
        estabelecimento,
        sensorId,
        dispotividoId,
        nome,
        tipoId,
        tipoDescricao,
        icone,
        sensores,
        latitude,
        longitude
      ];
}
