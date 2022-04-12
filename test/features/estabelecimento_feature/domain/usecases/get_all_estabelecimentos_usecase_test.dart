import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/repositories/i_estabelecimento_repository.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/estabelecimento_repository_mock.dart';
import '../../../../mocks/lista_de_estabelecimentos_mock.dart';

void main() {
  late GetAllEstabelecimentosUsecase usecase;
  late IEstabelecimentoRepository repository;

  setUp(() {
    repository = MockEstabelecimentoRepository();
    usecase = GetAllEstabelecimentosUsecase(repository);
  });

  test("should get a lista de estabelecimentos from the repository", () async {
    // Arrange
    when(() => repository.getAllEstabelecimentos())
        .thenAnswer((_) async => const Right(tListEstabelecimento));
    // Act
    final result = await usecase(NoParams());
    // Assert
    expect(result, const Right(tListEstabelecimento));
    verify(() => repository.getAllEstabelecimentos()).called(1);
  });

  test("should return a ServerFailure when don't succeed", () async {
    // Arrange
    when(() => repository.getAllEstabelecimentos())
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    final result = await usecase(NoParams());
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getAllEstabelecimentos()).called(1);
  });
}
