import 'package:fake_way/features/ativo_feature/data/models/ativo_model.dart';

abstract class IAtivoDataSource {
  Future<List<AtivoModel>> getAllAtivosByEstabelecimento(int estabelecimentoId);
}
