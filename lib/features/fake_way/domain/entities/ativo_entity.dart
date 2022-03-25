import 'package:equatable/equatable.dart';
import 'package:fake_way/features/fake_way/domain/entities/estabelecimento_entity.dart';

class Ativo extends Equatable {
  final Estabelecimento estabelecimento;
  final int sensorId;
  final int dispotividoId;
  final String? nome;
  final int tipoId;
  final String? tipoDescricao;
  final String? icone;
  final List<String>? sensores;
  final double latitude;
  final double longitude;

  Ativo(
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
