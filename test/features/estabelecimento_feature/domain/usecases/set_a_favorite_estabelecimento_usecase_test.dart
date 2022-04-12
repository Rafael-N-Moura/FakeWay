import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/repositories/i_estabelecimento_repository.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/set_a_favorite_estabelecimento_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/estabelecimento_mock.dart';
import '../../../../mocks/estabelecimento_repository_mock.dart';

void main() {
  late SetAFavoriteEstabelecimento usecase;
  late IEstabelecimentoRepository repository;

  setUp(() {
    repository = MockEstabelecimentoRepository();
    usecase = SetAFavoriteEstabelecimento(repository);
  });

  test("should call the repository with the right parameter", () async {
    // Arrange
    when(() => repository.setAFavoriteEstabelecimento(tEstabelecimentoMock))
        .thenAnswer((_) async => Right(NoParams()));
    // Act
    final result = await usecase.call(tEstabelecimentoMock);
    // Assert
    expect(result, Right(NoParams()));
    verify(() => repository.setAFavoriteEstabelecimento(tEstabelecimentoMock))
        .called(1);
  });

  test("should return a LocalDatabaseFailure when don't succeed", () async {
    // Arrange
    when(() => repository.setAFavoriteEstabelecimento(tEstabelecimentoMock))
        .thenAnswer((_) async => Left(LocalDatabaseFailure()));
    // Act
    final result = await usecase.call(tEstabelecimentoMock);
    // Assert
    expect(result, Left(LocalDatabaseFailure()));
    verify(() => repository.setAFavoriteEstabelecimento(tEstabelecimentoMock))
        .called(1);
  });
}
