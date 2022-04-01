import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/repositories/enviar_dado_repository.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/usecases/send_coordenada_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/coordenada_entity_mock.dart';

class MockEnviarDadoRepository extends Mock implements IEnviarDadoRepository {}

void main() {
  late IEnviarDadoRepository repository;
  late SendCoordenadaData usecase;

  setUp(() {
    repository = MockEnviarDadoRepository();
    usecase = SendCoordenadaData(repository);
  });

  test("should call the repository with the right parameter", () async {
    // Arrange
    when(() => repository.sendCoordenadaData(tCoordenadaModel))
        .thenAnswer((_) async => Right(NoParams()));
    // Act
    final result = await usecase.call(tCoordenadaModel);
    // Assert
    expect(result, Right(NoParams()));
    verify(() => repository.sendCoordenadaData(tCoordenadaModel)).called(1);
  });

  test("should return a ServerFailure when don't succeed", () async {
    // Arrange
    when(() => repository.sendCoordenadaData(tCoordenadaModel))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    final result = await usecase.call(tCoordenadaModel);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.sendCoordenadaData(tCoordenadaModel)).called(1);
  });
}
