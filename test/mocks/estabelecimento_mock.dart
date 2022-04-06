import 'package:fake_way/features/estabelecimento_feature/data/models/estabelecimento_model.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';

const tEstabelecimentoJsonMock = """
  {
    "company": 1,
    "companyName": "companyName"
  }
  """;

const tEstabelecimentoMock =
    Estabelecimento(companyId: 1, companyName: "companyName");

const tEstabelecimentoModelMock =
    EstabelecimentoModel(companyId: 1, companyName: "companyName");
