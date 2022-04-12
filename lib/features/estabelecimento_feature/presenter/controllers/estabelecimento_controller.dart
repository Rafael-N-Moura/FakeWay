import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_favorites_estabelecimentos.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_status_of_favorite_estabelecimento.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/remove_a_favorite_estabelecimento_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/set_a_favorite_estabelecimento_usecase.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';

part 'estabelecimento_controller.g.dart';

class EstabelecimentoController = _EstabelecimentoControllerBase
    with _$EstabelecimentoController;

abstract class _EstabelecimentoControllerBase with Store {
  final GetAllEstabelecimentosUsecase usecase;
  final GetAllFavoritesEstabelecimentos getFavoritesUsecase;
  final SetAFavoriteEstabelecimento setAFavoriteEstabelecimentoUsecase;
  final RemoveAFavoriteEstabelecimentoUsecase
      removeAFavoriteEstabelecimentoUsecase;
  final GetStatusOfFavoriteEstabelecimentoUsecase
      getStatusOfFavoriteEstabelecimentoUsecase;

  _EstabelecimentoControllerBase({
    required this.usecase,
    required this.getFavoritesUsecase,
    required this.setAFavoriteEstabelecimentoUsecase,
    required this.removeAFavoriteEstabelecimentoUsecase,
    required this.getStatusOfFavoriteEstabelecimentoUsecase,
  });

  @observable
  List<Estabelecimento>? estabelecimentos;

  @observable
  bool isLoading = false;

  @observable
  String filter = "";

  @observable
  bool sorted = false;

  @observable
  bool favoritesOn = false;

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
    favoritesOn = false;
    final result = await usecase(NoParams());
    result.fold((l) {
      return estabelecimentos = null;
    }, (sucess) {
      estabelecimentos = ObservableList.of(sucess);
    });
    isLoading = false;
  }

  @action
  Future<void> setAFavoriteEstabelecimento(
      Estabelecimento estabelecimento, BuildContext context) async {
    final result = await setAFavoriteEstabelecimentoUsecase(estabelecimento);
    result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Text(
            'Não foi possível adicionar esse estabelecimento aos favoritos',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      (r) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          content: Text(
            'Estabelecimento adicionado aos favoritos',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @action
  Future<void> removeAFavoriteEstabelecimento(
      int companyId, BuildContext context) async {
    final result = await removeAFavoriteEstabelecimentoUsecase(companyId);
    result.fold(
        (l) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: Colors.red,
                content: Text(
                  'Não foi possível remover esse estabelecimento dos favoritos',
                  textAlign: TextAlign.center,
                ),
              ),
            ), (r) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          content: Text(
            'Estabelecimento removido dos favoritos',
            textAlign: TextAlign.center,
          ),
        ),
      );
      getAllFavoritesEstabelecimentos();
    });
  }

  @action
  Future<bool?> getStatusOfFavoriteEstabelecimento(int companyId) async {
    bool? isFavorite;
    final result = await getStatusOfFavoriteEstabelecimentoUsecase(companyId);
    result.fold((l) => isFavorite = null, (sucess) {
      isFavorite = sucess;
    });

    return isFavorite;
  }

  @action
  Future<void> getAllFavoritesEstabelecimentos() async {
    isLoading = true;
    favoritesOn = true;
    final result = await getFavoritesUsecase(NoParams());
    result.fold((l) => null, (r) {
      estabelecimentos = ObservableList.of(r);
    });
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
