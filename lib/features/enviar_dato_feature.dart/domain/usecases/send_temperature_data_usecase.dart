import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/temperatura_model.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';

class SendTemperatureData implements UseCase<NoParams, TemperaturaModel> {
  final IAtivoRepository repository;

  SendTemperatureData(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(TemperaturaModel temperatura) async {
    return await repository.sendTemperatureData(temperatura);
  }
}
