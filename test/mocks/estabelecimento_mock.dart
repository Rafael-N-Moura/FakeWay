import 'package:fake_way/features/fake_way/data/models/estabelecimento_model.dart';

const tEstabelecimentoJsonMock = """
  {
    "company": 1,
    "companyName": "companyName"
  }
  """;

const tEstabelecimentoMock =
    EstabelecimentoModel(companyId: 1, companyName: "companyName");
