import 'package:equatable/equatable.dart';

import 'package:fake_way/features/enviar_dado_feature/domain/entities/coordenada_entity.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/umidade_entity.dart';
import 'package:hive/hive.dart';

import '../../../ativo_feature/domain/entities/ativo_entity.dart';

class HistoricoEntity extends Equatable {
  @HiveField(0)
  final Ativo ativo;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final Temperatura? temperatura;
  @HiveField(3)
  final Umidade? umidade;
  @HiveField(4)
  final Coordenada? coordenada;

  const HistoricoEntity({
    required this.ativo,
    required this.type,
    this.temperatura,
    this.umidade,
    this.coordenada,
  });

  @override
  List<Object?> get props => [ativo, type, temperatura, umidade, coordenada];
}
