import 'package:fake_way/features/ativo_feature/data/models/ativo_model.dart';
import 'package:fake_way/features/ativo_feature/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';

import 'ativo_mock.dart';
import 'estabelecimento_id_mock.dart';

const List<AtivoModel> tAtivoModelList = [
  AtivoModel(
    estabelecimento: Estabelecimento(
        companyId: tEstabelecimentoId, companyName: 'companyName'),
    sensorId: 1,
    dispotividoId: 1,
    nome: 'nome',
    tipoId: 1,
    tipoDescricao: 'descrição',
    icone: 'icone',
    sensores: ['sensores'],
    latitude: 1.0,
    longitude: 1.0,
  ),
];

const List<Ativo> tAtivoList = [tAtivoMock];
