import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/repositories/enviar_dado_repository.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/usecases/send_temperature_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/temperatura_entity_mock.dart';

class MockEnviarDadoRepository extends Mock implements IEnviarDadoRepository {}

void main() {
  late SendTemperatureData usecase;
  late IEnviarDadoRepository repository;

  setUp(() {
    repository = MockEnviarDadoRepository();
    usecase = SendTemperatureData(repository);
  });

  test('should call the repository with the right parameter', () async {
    when(() => repository.sendTemperatureData(tTemperatureModel))
        .thenAnswer((_) async => Right(NoParams()));

    await usecase(tTemperatureModel);

    verify(() => repository.sendTemperatureData(tTemperatureModel)).called(1);
  });

  test('should return a ServerFailure when don\'t succeed', () async {
    when(() => repository.sendTemperatureData(tTemperatureModel))
        .thenAnswer((_) async => Left(ServerFailure()));

    final result = await usecase(tTemperatureModel);

    expect(result, Left(ServerFailure()));

    verify(() => repository.sendTemperatureData(tTemperatureModel)).called(1);
  });
}
