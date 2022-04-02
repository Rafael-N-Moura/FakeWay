import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/i_estabelecimento_data_source.dart';
import 'package:fake_way/features/estabelecimento_feature/data/repositories/estabelecimento_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/lista_de_estabelecimentos_mock.dart';

class MockDataSource extends Mock implements IEstabelecimentoDataSource {}

void main() {
  late EstabelecimentoRepositoryImplementation repository;
  late IEstabelecimentoDataSource dataSource;

  setUp(() {
    dataSource = MockDataSource();
    repository = EstabelecimentoRepositoryImplementation(dataSource);
  });

  test("should return a list of Estabelecimentos when calls the data source",
      () async {
    // Assert
    when(() => dataSource.getAllEstabelecimentos())
        .thenAnswer((_) async => tListEstabelecimento);
    // Act
    final result = await repository.getAllEstabelecimentos();
    // Arrange
    expect(result, const Right(tListEstabelecimento));
    verify(() => dataSource.getAllEstabelecimentos()).called(1);
  });

  test(
      "should return a server failure when the call to datasource is unsuccessful",
      () async {
    // Assert
    when(() => dataSource.getAllEstabelecimentos())
        .thenThrow(ServerException());
    // Act
    final result = await repository.getAllEstabelecimentos();
    // Arrange
    expect(result, Left(ServerFailure()));
    verify(() => dataSource.getAllEstabelecimentos()).called(1);
  });
}
