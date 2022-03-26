import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/features/fake_way/domain/entities/coordenada_entity.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';
import 'package:fake_way/features/fake_way/domain/usecases/send_coordenada_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAtivoRepository extends Mock implements IAtivoRepository {}

void main() {
  late IAtivoRepository repository;
  late SendCoordenadaData usecase;

  setUp(() {
    repository = MockAtivoRepository();
    usecase = SendCoordenadaData(repository);
  });

  final tCoordenada = Coordenada(
      data: DateTime(2022, 03, 26),
      dispositivoId: 1,
      latitude: 1,
      longitude: 1,
      sensorId: 1,
      velocidade: 1);
  void tVoid;

  test("should call the repository with the right parameter", () async {
    // Arrange
    when(() => repository.sendCoordenadaData(tCoordenada))
        .thenAnswer((_) async => Right(tVoid));
    // Act
    final result = await usecase.call(tCoordenada);
    // Assert
    expect(result, Right(tVoid));
    verify(() => repository.sendCoordenadaData(tCoordenada)).called(1);
  });

  test("should return a ServerFailure when don\'t succeed", () async {
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
