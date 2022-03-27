import 'package:fake_way/features/fake_way/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/fake_way/domain/entities/estabelecimento_entity.dart';

import 'estabelecimento_id_mock.dart';

const List<Ativo> tAtivosList = [
  Ativo(
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
      longitude: 1.0),
];
