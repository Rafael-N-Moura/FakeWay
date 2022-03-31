import '../models/estabelecimento_model.dart';

abstract class IDataSource {
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos();
}
