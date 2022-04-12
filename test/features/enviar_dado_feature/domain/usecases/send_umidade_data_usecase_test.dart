import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_umidade_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/umidade_entity_mock.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/repositories/enviar_dado_repository.dart';

class MockEnviarDadoRepository extends Mock implements IEnviarDadoRepository {}

void main() {
  late SendUmidadeDataUsecase usecase;
  late IEnviarDadoRepository repository;

  setUp(() {
    repository = MockEnviarDadoRepository();
    usecase = SendUmidadeDataUsecase(repository);
  });

  test("should call the repository with the right parameter", () async {
    // Arrange
    when(() => repository.sendUmidadeData(tUmidadeModel))
        .thenAnswer((_) async => Right(NoParams()));
    // Act
    final result = await usecase.call(tUmidadeModel);
    // Assert
    expect(result, Right(NoParams()));
    verify(() => repository.sendUmidadeData(tUmidadeModel)).called(1);
  });

  test("should return a ServerFailure when don't succeed", () async {
    // Arrange
    when(() => repository.sendUmidadeData(tUmidadeModel))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    final result = await usecase.call(tUmidadeModel);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.sendUmidadeData(tUmidadeModel)).called(1);
  });
}
