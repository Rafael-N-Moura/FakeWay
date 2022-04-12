import 'package:fake_way/features/historico_feature/domain/usecases/get_total_historico_usecase.dart';
import 'package:fake_way/features/historico_feature/domain/usecases/store_historico_usecase.dart';
import 'package:fake_way/features/historico_feature/presentation/controllers/historico_controller.dart';
import 'package:fake_way/features/historico_feature/presentation/pages/historico_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/historico_data_source_implementation.dart';
import 'data/repositories/historico_repository_implementation.dart';

class HistoricoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const HistoricoPage()),
      ];
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => HistoricoDataSourceImplementation(), export: true),
        Bind((i) => HistoricoRepositoryImplementation(i()), export: true),
        Bind.singleton((i) => GetTotalHistoryUsecase(i()), export: true),
        Bind.singleton(
            (i) => StoreHistoricoUsecase(
                  i(),
                ),
            export: true),
        Bind.singleton(
            (i) => HistoricoController(
                getTotalHistoryUsecase: i(), storeHistoricoUsecase: i()),
            export: true)
      ];
}
