import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/repositories/i_estabelecimento_repository.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_favorites_estabelecimentos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/estabelecimento_repository_mock.dart';
import '../../../../mocks/lista_de_estabelecimentos_mock.dart';

void main() {
  late GetAllFavoritesEstabelecimentos usecase;
  late IEstabelecimentoRepository repository;

  setUp(() {
    repository = MockEstabelecimentoRepository();
    usecase = GetAllFavoritesEstabelecimentos(repository);
  });

  test("should get a list of favorites estabelecimentos from the repository",
      () async {
    // Arrange
    when(() => repository.getAllFavoritesEstabelecimentos())
        .thenAnswer((_) async => const Right(tListEstabelecimento));
    // Act
    final result = await usecase(NoParams());
    // Assert
    expect(result, const Right(tListEstabelecimento));
    verify(() => repository.getAllFavoritesEstabelecimentos()).called(1);
  });

  test("should return a LocalDatabaseFailure when don't succeed", () async {
    // Arrange
    when(() => repository.getAllFavoritesEstabelecimentos())
        .thenAnswer((_) async => Left(LocalDatabaseFailure()));
    // Act
    final result = await usecase(NoParams());
    // Assert
    expect(result, Left(LocalDatabaseFailure()));
    verify(() => repository.getAllFavoritesEstabelecimentos()).called(1);
  });
}
