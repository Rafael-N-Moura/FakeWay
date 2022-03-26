import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/features/fake_way/domain/entities/umidade_entity.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';
import 'package:fake_way/features/fake_way/domain/usecases/send_umidade_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAtivoRepository extends Mock implements IAtivoRepository {}

void main() {
  late SendUmidadeDataUsecase usecase;
  late IAtivoRepository repository;

  DateTime tDate = DateTime(2022, 3, 26);
  Umidade tUmidade =
      Umidade(dispositivoId: 1, sensorId: 2, data: tDate, umidade: 1);

  setUp(() {
    repository = MockAtivoRepository();
    usecase = SendUmidadeDataUsecase(repository);
  });

  void tVoid;

  test("should send a umidade data to api", () async {
    // Arrange
    when(() => repository.sendUmidadeData(tUmidade))
        .thenAnswer((_) async => Right(tVoid));
    // Act
    final result = await usecase.call(tUmidade);
    // Assert
    expect(result, Right(tVoid));
    verify(() => repository.sendUmidadeData(tUmidade)).called(1);
  });

  test("should return a ServerFailure when don\'t succeed", () async {
    // Arrange
    when(() => repository.sendUmidadeData(tUmidade))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    final result = await usecase.call(tUmidade);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.sendUmidadeData(tUmidade)).called(1);
  });
}
