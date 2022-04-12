import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/repositories/enviar_dado_repository.dart';

import '../entities/coordenada_entity.dart';

class SendCoordenadaData implements UseCase<NoParams, Coordenada> {
  final IEnviarDadoRepository repository;

  SendCoordenadaData(this.repository);
  @override
  Future<Either<Failure, NoParams>> call(Coordenada coordenada) async {
    return await repository.sendCoordenadaData(coordenada);
  }
}
