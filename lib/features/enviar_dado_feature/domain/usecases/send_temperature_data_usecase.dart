import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/temperatura_model.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/repositories/enviar_dado_repository.dart';

import '../entities/temperatura_entity.dart';

class SendTemperatureData implements UseCase<NoParams, Temperatura> {
  final IEnviarDadoRepository repository;

  SendTemperatureData(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(Temperatura temperatura) async {
    return await repository.sendTemperatureData(temperatura);
  }
}
