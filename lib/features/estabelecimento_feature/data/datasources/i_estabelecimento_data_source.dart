import '../models/estabelecimento_model.dart';

abstract class IEstabelecimentoDataSource {
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos();
}
