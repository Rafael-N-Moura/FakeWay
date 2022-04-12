import 'package:fake_way/features/ativo_feature/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/coordenata_model.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/temperatura_model.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/umidade_model.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/coordenada_entity.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/historico_feature/domain/entities/historico_entity.dart';
import 'package:hive/hive.dart';

import '../../../enviar_dado_feature/domain/entities/umidade_entity.dart';

part 'historico_model.g.dart';

@HiveType(typeId: 1)
class HistoricoModel extends HistoricoEntity {
  const HistoricoModel({
    required Ativo ativo,
    required String type,
    required Temperatura? temperatura,
    required Umidade? umidade,
    required Coordenada? coordenada,
  }) : super(
          ativo: ativo,
          type: type,
          temperatura: temperatura,
          umidade: umidade,
          coordenada: coordenada,
        );
}
