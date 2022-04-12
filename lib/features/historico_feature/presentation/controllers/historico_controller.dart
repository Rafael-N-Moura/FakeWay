import 'package:fake_way/features/historico_feature/domain/usecases/store_historico_usecase.dart';
import 'package:mobx/mobx.dart';

import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/historico_feature/domain/entities/historico_entity.dart';
import 'package:fake_way/features/historico_feature/domain/usecases/get_total_historico_usecase.dart';

part 'historico_controller.g.dart';

class HistoricoController = _HistoricoControllerBase with _$HistoricoController;

abstract class _HistoricoControllerBase with Store {
  GetTotalHistoryUsecase getTotalHistoryUsecase;
  StoreHistoricoUsecase storeHistoricoUsecase;

  _HistoricoControllerBase({
    required this.getTotalHistoryUsecase,
    required this.storeHistoricoUsecase,
  });

  @observable
  bool isLoading = false;

  @observable
  List<HistoricoEntity>? historico;

  @observable
  String filter = "";

  @action
  void setFilter(String value) {
    filter = value;
  }

  @computed
  List<HistoricoEntity> get listFiltered {
    if (filter.isEmpty) {
      return historico!;
    } else {
      return historico!
          .where((item) => item.ativo.estabelecimento.companyName
              .toLowerCase()
              .contains(filter.toLowerCase()))
          .toList();
    }
  }

  @action
  Future<void> getTotalHistorico() async {
    isLoading = true;

    final result = await getTotalHistoryUsecase(NoParams());
    result.fold((l) {
      return historico = null;
    }, (sucess) {
      historico = ObservableList.of(sucess);
    });
    isLoading = false;
  }

  @action
  Future<void> storeHistorico(HistoricoEntity historico) async {
    final result = await storeHistoricoUsecase(historico);
  }
}
