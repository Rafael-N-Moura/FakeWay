import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/features/fake_way/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';
import 'package:fake_way/features/fake_way/domain/usecases/send_temperature_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAtivoRepository extends Mock implements IAtivoRepository {}

void main() {
  late SendTemperatureData usecase;
  late IAtivoRepository repository;

  setUp(() {
    repository = MockAtivoRepository();
    usecase = SendTemperatureData(repository);
  });
  final DateTime tDateTime = DateTime(2022, 03, 25);
  final tTemperature = Temperatura(
      dispositivoId: 1, sensorId: 1, data: tDateTime, temperatura: 1.0);

  test('should call the repository with the right parameter', () async {
    when(() => repository.sendTemperatureData(tTemperature))
        .thenAnswer((_) async => Right(void _r);
    await usecase(tTemperature);

    //verify(() => repository.sendTemperatureData(tTemperature)).called(1);
  });

  test('should return a ServerFailure when don\'t succeed', () async {
    when(() => repository.sendTemperatureData(tTemperature))
        .thenAnswer((_) async => Left(ServerFailure()));

    final result = await usecase(tTemperature);

    expect(result, Left(ServerFailure()));

    verify(() => repository.sendTemperatureData(tTemperature)).called(1);
  });
}
