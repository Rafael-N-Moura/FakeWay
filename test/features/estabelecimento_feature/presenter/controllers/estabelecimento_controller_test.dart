import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_favorites_estabelecimentos.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_status_of_favorite_estabelecimento.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/remove_a_favorite_estabelecimento_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/set_a_favorite_estabelecimento_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/controllers/estabelecimento_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/lista_de_estabelecimentos_mock.dart';

class MockGetAllEstabelecimentosUsecase extends Mock
    implements GetAllEstabelecimentosUsecase {}

class MockGetAllFavoritesEstabelecimentos extends Mock
    implements GetAllFavoritesEstabelecimentos {}

class MockRemoveAFavoriteEstabelecimentoUsecase extends Mock
    implements RemoveAFavoriteEstabelecimentoUsecase {}

class MockGetStatusOfFavoriteEstabelecimentoUsecase extends Mock
    implements GetStatusOfFavoriteEstabelecimentoUsecase {}

class MockSetAFavoriteEstabelecimento extends Mock
    implements SetAFavoriteEstabelecimento {}

main() {
  late EstabelecimentoController controller;
  late GetAllEstabelecimentosUsecase usecase;
  late GetAllFavoritesEstabelecimentos getAllFavoritesEstabelecimentos;
  late RemoveAFavoriteEstabelecimentoUsecase
      removeAFavoriteEstabelecimentoUsecase;
  late GetStatusOfFavoriteEstabelecimentoUsecase
      getStatusOfFavoriteEstabelecimentoUsecase;
  late SetAFavoriteEstabelecimento setAFavoriteEstabelecimento;
  setUp(() {
    usecase = MockGetAllEstabelecimentosUsecase();
    getAllFavoritesEstabelecimentos = MockGetAllFavoritesEstabelecimentos();
    removeAFavoriteEstabelecimentoUsecase =
        MockRemoveAFavoriteEstabelecimentoUsecase();
    getStatusOfFavoriteEstabelecimentoUsecase =
        MockGetStatusOfFavoriteEstabelecimentoUsecase();
    setAFavoriteEstabelecimento = MockSetAFavoriteEstabelecimento();
    controller = EstabelecimentoController(
        usecase: usecase,
        getFavoritesUsecase: getAllFavoritesEstabelecimentos,
        removeAFavoriteEstabelecimentoUsecase:
            removeAFavoriteEstabelecimentoUsecase,
        getStatusOfFavoriteEstabelecimentoUsecase:
            getStatusOfFavoriteEstabelecimentoUsecase,
        setAFavoriteEstabelecimentoUsecase: setAFavoriteEstabelecimento);
  });

  test("should return a list of estabelecimentos from the usecase", () async {
    // Arrange
    when(() => usecase(NoParams()))
        .thenAnswer((_) async => const Right(tListEstabelecimentoMock));
    // Act
    await controller.getAllEstabelecimentos();
    // Assert
    expect(controller.estabelecimentos, tListEstabelecimentoMock);
    //verify(() => controller.getAllEstabelecimentos()).called(1);
  });

  test("should return a null List from the usecase when dont successful",
      () async {
    // Arrange
    when(() => usecase(NoParams()))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    await controller.getAllEstabelecimentos();
    // Assert
    expect(controller.estabelecimentos, null);
    //verify(() => controller.getAllEstabelecimentos()).called(1);
  });
}
