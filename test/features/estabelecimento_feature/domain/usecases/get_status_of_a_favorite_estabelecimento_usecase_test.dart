import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/repositories/i_estabelecimento_repository.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_status_of_favorite_estabelecimento.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/estabelecimento_id_mock.dart';

import '../../../../mocks/estabelecimento_repository_mock.dart';

void main() {
  late GetStatusOfFavoriteEstabelecimentoUsecase usecase;
  late IEstabelecimentoRepository repository;

  setUp(() {
    repository = MockEstabelecimentoRepository();
    usecase = GetStatusOfFavoriteEstabelecimentoUsecase(repository);
  });

  test("should get a bool from the repository", () async {
    // Arrange
    when(() =>
            repository.getStatusOfFavoriteEstabelecimento(tEstabelecimentoId))
        .thenAnswer((_) async => const Right(true));
    // Act
    final result = await usecase(tEstabelecimentoId);
    // Assert
    expect(result, const Right(true));
    verify(() =>
            repository.getStatusOfFavoriteEstabelecimento(tEstabelecimentoId))
        .called(1);
  });

  test("should return a LocalDatabaseFailure when don't succeed", () async {
    // Arrange
    when(() =>
            repository.getStatusOfFavoriteEstabelecimento(tEstabelecimentoId))
        .thenAnswer((_) async => Left(LocalDatabaseFailure()));
    // Act
    final result = await usecase(tEstabelecimentoId);
    // Assert
    expect(result, Left(LocalDatabaseFailure()));
    verify(() =>
            repository.getStatusOfFavoriteEstabelecimento(tEstabelecimentoId))
        .called(1);
  });
}
