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
  ObservableList<Estabelecimento> estabelecimentos =
      ObservableList<Estabelecimento>();

  @action
  getAllEstabelecimentos() async {
    final result = await usecase(NoParams());
    result.fold(
        (l) => null, (sucess) => estabelecimentos = ObservableList.of(sucess));
  }
}
