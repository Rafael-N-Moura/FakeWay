import 'package:fake_way/features/historico_feature/data/models/historico_model.dart';

abstract class IHistoricoDataSource {
  Future<List<HistoricoModel>> getTotalHistorico();
  Future storeHistorico(HistoricoModel historico);
}
