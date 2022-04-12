import 'package:fake_way/features/estabelecimento_feature/data/datasources/estabelecimento_data_source_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/estabelecimento_local_data_source_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/data/repositories/estabelecimento_repository_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_favorites_estabelecimentos.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_status_of_favorite_estabelecimento.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/remove_a_favorite_estabelecimento_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/set_a_favorite_estabelecimento_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/controllers/estabelecimento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/pages/estabelecimento_page.dart';

class EstabelecimentoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const EstabelecimentoPage()),
      ];
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => EstabelecimentoDataSourceImplementation(i()),
        ),
        Bind(
          (i) => EstabelecimentoLocalDatasourceImplementation(),
        ),
        Bind((i) => EstabelecimentoRepositoryImplementation(i(), i())),
        Bind.singleton(
          (i) => GetAllEstabelecimentosUsecase(i()),
        ),
        Bind.singleton(
          (i) => GetAllFavoritesEstabelecimentos(i()),
        ),
        Bind.singleton(
          (i) => SetAFavoriteEstabelecimento(i()),
        ),
        Bind.singleton(
          (i) => RemoveAFavoriteEstabelecimentoUsecase(i()),
        ),
        Bind.singleton(
          (i) => GetStatusOfFavoriteEstabelecimentoUsecase(i()),
        ),
        Bind.singleton(((i) => EstabelecimentoController(
              usecase: i(),
              getFavoritesUsecase: i(),
              setAFavoriteEstabelecimentoUsecase: i(),
              removeAFavoriteEstabelecimentoUsecase: i(),
              getStatusOfFavoriteEstabelecimentoUsecase: i(),
            ))),
      ];
}
