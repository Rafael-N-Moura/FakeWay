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

  group('send data', () {
    test(
        'Sucess case - should call the datasource with the right Umidade param',
        () async {
      when(() => dataSource.sendUmidadeData(tUmidade))
          .thenAnswer((_) async => NoParams());

      await repository.sendUmidadeData(tUmidade);

      verify(() => dataSource.sendUmidadeData(tUmidade)).called(1);
    });

    test(
        'Error case - should return a server failure when unable to send umidade data',
        () async {
      when(() => dataSource.sendUmidadeData(tUmidade))
          .thenThrow(ServerException());

      final result = await repository.sendUmidadeData(tUmidade);

      expect(result, Left(ServerFailure()));

      verify(() => dataSource.sendUmidadeData(tUmidade)).called(1);
    });

    test(
        'Sucess case - should call the datasource with the right Coordenada param',
        () async {
      when(() => dataSource.sendCoordenadaData(tCoordenadaModel))
          .thenAnswer((_) async => NoParams());

      await repository.sendCoordenadaData(tCoordenadaModel);

      verify(() => dataSource.sendCoordenadaData(tCoordenadaModel)).called(1);
    });

    test(
        'Error case - should return a server failure when unable to send Coordenada data',
        () async {
      when(() => dataSource.sendCoordenadaData(tCoordenadaModel))
          .thenThrow(ServerException());

      final result = await repository.sendCoordenadaData(tCoordenadaModel);

      expect(result, Left(ServerFailure()));

      verify(() => dataSource.sendCoordenadaData(tCoordenadaModel)).called(1);
    });

    test(
        'Sucess case - should call the datasource with the right Temperatura param',
        () async {
      when(() => dataSource.sendTemperatureData(tTemperature))
          .thenAnswer((_) async => NoParams());

      await repository.sendTemperatureData(tTemperature);

      verify(() => dataSource.sendTemperatureData(tTemperature)).called(1);
    });

    test(
        'Error case - should return a server failure when unable to send Temperatura data',
        () async {
      when(() => dataSource.sendTemperatureData(tTemperature))
          .thenThrow(ServerException());

      final result = await repository.sendTemperatureData(tTemperature);

      expect(result, Left(ServerFailure()));

      verify(() => dataSource.sendTemperatureData(tTemperature)).called(1);
    });
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
