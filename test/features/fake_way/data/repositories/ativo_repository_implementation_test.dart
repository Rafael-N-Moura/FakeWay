import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/fake_way/data/datasources/i_data_source.dart';
import 'package:fake_way/features/fake_way/data/repositories/ativo_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/coordenada_entity_mock.dart';
import '../../../../mocks/estabelecimento_id_mock.dart';
import '../../../../mocks/lista_de_ativos_mock.dart';
import '../../../../mocks/temperatura_entity_mock.dart';
import '../../../../mocks/umidade_entity_mock.dart';

class MockDataSource extends Mock implements IDataSource {}

void main() {
  late AtivoRepositoryImplementation repository;
  late IDataSource dataSource;

  setUp(() {
    dataSource = MockDataSource();
    repository = AtivoRepositoryImplementation(dataSource);
  });

  test("should return a List of Ativos when calls the data source", () async {
    // Arrange
    when(() => dataSource.getAllAtivosByEstabelecimento(tEstabelecimentoId))
        .thenAnswer((_) async => tAtivosList);
    // Act
    final result =
        await repository.getAllAtivosByEstabelecimento(tEstabelecimentoId);
    // Assert
    expect(result, const Right(tAtivosList));
    verify(() => dataSource.getAllAtivosByEstabelecimento(tEstabelecimentoId))
        .called(1);
  });

  test(
      "should return a server failure when the call to datasource is unsuccessful",
      () async {
    // Arrange
    when(() => dataSource.getAllAtivosByEstabelecimento(tEstabelecimentoId))
        .thenThrow(ServerException());
    // Act
    final result =
        await repository.getAllAtivosByEstabelecimento(tEstabelecimentoId);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => dataSource.getAllAtivosByEstabelecimento(tEstabelecimentoId))
        .called(1);
  });
}
