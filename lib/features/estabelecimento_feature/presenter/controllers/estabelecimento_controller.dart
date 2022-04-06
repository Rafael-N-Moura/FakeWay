import 'package:fake_way/core/usecases/usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';

part 'estabelecimento_controller.g.dart';

class EstabelecimentoController = _EstabelecimentoControllerBase
    with _$EstabelecimentoController;

abstract class _EstabelecimentoControllerBase with Store {
  final GetAllEstabelecimentosUsecase usecase;

  _EstabelecimentoControllerBase({
    required this.usecase,
  });

  @observable
  List<Estabelecimento>? estabelecimentos;

  @observable
  bool isLoading = false;

  @observable
  String filter = "";

  @observable
  bool sorted = false;

  @computed
  List<Estabelecimento> get listFiltered {
    if (filter.isEmpty) {
      return estabelecimentos!;
    } else {
      return estabelecimentos!
          .where((item) =>
              item.companyName.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @action
  getAllEstabelecimentos() async {
    isLoading = true;
    final result = await usecase(NoParams());
    result.fold((l) {
      return estabelecimentos = null;
    }, (sucess) => estabelecimentos = ObservableList.of(sucess));
    isLoading = false;
  }

  @action
  setFilter(String value) => filter = value;

  @action
  sortList() {
    listFiltered.sort(
      (a, b) => sorted
          ? a.companyName.compareTo(b.companyName)
          : a.companyId.compareTo(b.companyId),
    );
    sorted = !sorted;
  }
}
