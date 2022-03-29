import 'package:fake_way/features/fake_way/data/models/ativo_model.dart';

import 'estabelecimento_mock.dart';

const tAtivoJsonMock = """
{
  "company":1,
  "companyName":"companyName",
      "sensorId":1,
      "deviceId":1,
      "name":"nome",
      "typeId":1,
      "typeDescription":"tipoDescricao",
      "icon":"icone",
      "sensors":['sensores'],
      "latitude":1,
      "longitude":1
}
""";

const tAtivoMock = AtivoModel(
    estabelecimento: tEstabelecimentoMock,
    sensorId: 1,
    dispotividoId: 1,
    nome: "nome",
    tipoId: 1,
    tipoDescricao: "tipoDescricao",
    icone: "icone",
    sensores: ["sensores"],
    latitude: 1,
    longitude: 1);
