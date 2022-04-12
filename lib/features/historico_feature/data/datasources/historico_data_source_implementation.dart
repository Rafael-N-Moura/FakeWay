import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/historico_feature/data/datasources/historico_data_source.dart';
import 'package:fake_way/features/historico_feature/data/models/historico_model.dart';
import 'package:hive/hive.dart';

import '../../../../core/errors/exceptions.dart';

class HistoricoDataSourceImplementation implements IHistoricoDataSource {
  @override
  Future<List<HistoricoModel>> getTotalHistorico() async {
    try {
      List<HistoricoModel> list = [];
      final historicoBox = await Hive.openBox('historico_box');
      if (historicoBox.isNotEmpty) {
        for (var key in historicoBox.keys) {
          list.add(await historicoBox.get(key));
        }
      }
      return Future.value(list);
    } catch (e) {
      throw LocalDatabaseException();
    }
  }

  @override
  Future storeHistorico(HistoricoModel historico) async {
    try {
      final historicoBox = await Hive.openBox('historico_box');
      await historicoBox.put(
          '${historico.ativo.estabelecimento.companyId}+${historico.ativo.nome}+${DateTime.now().toString()}',
          historico);

      return Future.value(NoParams());
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
}
