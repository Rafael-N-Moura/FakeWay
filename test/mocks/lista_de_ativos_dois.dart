import 'package:fake_way/features/ativo_feature/data/models/ativo_model.dart';
import 'package:fake_way/features/estabelecimento_feature/data/models/estabelecimento_model.dart';

const List<AtivoModel> tAtivosList2 = [
  AtivoModel(
    estabelecimento:
        EstabelecimentoModel(companyId: 1, companyName: 'Estabelecimento Mock'),
    sensorId: 485,
    dispotividoId: 1989,
    nome: 'PRL9331',
    tipoId: 26,
    tipoDescricao: 'CAMINHÃO VERMELHO',
    icone: 'CaminhaoVermelho',
    sensores: ["Logistics", "Temperature"],
    latitude: null,
    longitude: null,
  ),
  AtivoModel(
    estabelecimento:
        EstabelecimentoModel(companyId: 1, companyName: 'Estabelecimento Mock'),
    sensorId: 45325,
    dispotividoId: 3253,
    nome: 'SDADSAD',
    tipoId: 343,
    tipoDescricao: 'BOLO',
    icone: 'Bolo',
    sensores: ["Logistics", "Temperature"],
    latitude: null,
    longitude: null,
  ),
  // AtivoModel(
  //   estabelecimento:
  //       Estabelecimento(companyId: 2, companyName: 'Estabelecimento Mock 2'),
  //   sensorId: 1397,
  //   dispotividoId: 1801,
  //   nome: 'OGX3131',
  //   tipoId: 26,
  //   tipoDescricao: 'CAMINHÃO VERMELHO',
  //   icone: 'CaminhaoVermelho',
  //   sensores: ["Logistics", "Temperature"],
  //   latitude: null,
  //   longitude: null,
  // ),
  // AtivoModel(
  //   estabelecimento:
  //       Estabelecimento(companyId: 3, companyName: 'Estabelecimento Mock 3'),
  //   sensorId: 1917,
  //   dispotividoId: 2318,
  //   nome: 'OGZ7283',
  //   tipoId: 26,
  //   tipoDescricao: 'CAMINHÃO VERMELHO',
  //   icone: 'CaminhaoVermelho',
  //   sensores: ["Logistics", "Temperature"],
  //   latitude: null,
  //   longitude: null,
  // ),
];
