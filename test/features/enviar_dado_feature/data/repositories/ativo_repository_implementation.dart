import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/datasources/data_source.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/repositories/enviar_dato_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/coordenada_entity_mock.dart';
import '../../../../mocks/temperatura_entity_mock.dart';
import '../../../../mocks/umidade_entity_mock.dart';

class MockDataSource extends Mock implements IDataSource {}

void main() {
  late EnviarDadoRepositoryImplementation repository;
  late IDataSource dataSource;

  setUp(() {
    dataSource = MockDataSource();
    repository = EnviarDadoRepositoryImplementation(dataSource);
  });

  group('send data', () {
    test(
        'Sucess case - should call the datasource with the right Umidade param',
        () async {
      when(() => dataSource.sendUmidadeData(tUmidadeModel))
          .thenAnswer((_) async => NoParams());

      await repository.sendUmidadeData(tUmidadeModel);

      verify(() => dataSource.sendUmidadeData(tUmidadeModel)).called(1);
    });

    test(
        'Error case - should return a server failure when unable to send umidade data',
        () async {
      when(() => dataSource.sendUmidadeData(tUmidadeModel))
          .thenThrow(ServerException());

      final result = await repository.sendUmidadeData(tUmidadeModel);

      expect(result, Left(ServerFailure()));

      verify(() => dataSource.sendUmidadeData(tUmidadeModel)).called(1);
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
      when(() => dataSource.sendTemperatureData(tTemperatureModel))
          .thenAnswer((_) async => NoParams());

      await repository.sendTemperatureData(tTemperatureModel);

      verify(() => dataSource.sendTemperatureData(tTemperatureModel)).called(1);
    });

    test(
        'Error case - should return a server failure when unable to send Temperatura data',
        () async {
      when(() => dataSource.sendTemperatureData(tTemperatureModel))
          .thenThrow(ServerException());

      final result = await repository.sendTemperatureData(tTemperatureModel);

      expect(result, Left(ServerFailure()));

      verify(() => dataSource.sendTemperatureData(tTemperatureModel)).called(1);
    });
  });
}
