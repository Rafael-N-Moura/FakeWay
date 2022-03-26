import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';
import 'package:fake_way/features/fake_way/domain/usecases/send_coordenada_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/ativo_repository_mock.dart';
import '../../../../mocks/coordenada_entity_mock.dart';

void main() {
  late IAtivoRepository repository;
  late SendCoordenadaData usecase;

  setUp(() {
    repository = MockAtivoRepository();
    usecase = SendCoordenadaData(repository);
  });

  test("should call the repository with the right parameter", () async {
    // Arrange
    when(() => repository.sendCoordenadaData(tCoordenada))
        .thenAnswer((_) async => Right(NoParams()));
    // Act
    final result = await usecase.call(tCoordenada);
    // Assert
    expect(result, Right(NoParams()));
    verify(() => repository.sendCoordenadaData(tCoordenada)).called(1);
  });

  test("should return a ServerFailure when don't succeed", () async {
    // Arrange
    when(() => repository.sendCoordenadaData(tCoordenada))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    final result = await usecase.call(tCoordenada);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.sendCoordenadaData(tCoordenada)).called(1);
  });
}
