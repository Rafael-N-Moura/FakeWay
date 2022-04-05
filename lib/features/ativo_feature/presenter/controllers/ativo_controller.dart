import 'package:mobx/mobx.dart';

import 'package:fake_way/features/ativo_feature/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/ativo_feature/domain/usecases/get_all_ativos_by_estabelecimento_usecase.dart';

part 'ativo_controller.g.dart';

class AtivoController = _AtivoControllerBase with _$AtivoController;

abstract class _AtivoControllerBase with Store {
  final GetAllAtivosByEstabelecimentoUsecase usecase;

  _AtivoControllerBase({
    required this.usecase,
  });

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Ativo> ativos = ObservableList<Ativo>();

  @observable
  String filter = "";

  @observable
  bool sorted = false;

  @computed
  List<Ativo> get listFiltered {
    if (filter.isEmpty) {
      return ativos;
    } else {
      return ativos.where((item) {
        return item.nome!.toLowerCase().contains(filter.toLowerCase());
      }).toList();
    }
  }

  @action
  getAllAtivos(int idEstabelecimento) async {
    isLoading = true;
    final result = await usecase(idEstabelecimento);
    result.fold((l) => null, (sucess) => ativos = ObservableList.of(sucess));
    isLoading = false;
  }

  @action
  setFilter(String value) => filter = value;

  @action
  sortList() {
    listFiltered.sort(
      (a, b) {
        return sorted && a.nome != null && b.nome != null
            ? a.nome!.compareTo(b.nome!)
            : b.nome!.compareTo(a.nome!);
      },
    );
    sorted = !sorted;
  }
}
