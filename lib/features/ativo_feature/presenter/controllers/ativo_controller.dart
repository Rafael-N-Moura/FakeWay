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

  @action
  getAllAtivos(int idEstabelecimento) async {
    isLoading = true;
    final result = await usecase(idEstabelecimento);
    result.fold((l) => null, (sucess) => ativos = ObservableList.of(sucess));
    isLoading = false;
  }
}
