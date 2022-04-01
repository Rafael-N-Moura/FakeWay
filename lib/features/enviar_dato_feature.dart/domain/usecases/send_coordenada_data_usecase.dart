import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/coordenata_model.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';

import '../entities/coordenada_entity.dart';

class SendCoordenadaData implements UseCase<NoParams, CoordenadaModel> {
  final IAtivoRepository repository;

  SendCoordenadaData(this.repository);
  @override
  Future<Either<Failure, NoParams>> call(Coordenada coordenada) async {
    return await repository.sendCoordenadaData(coordenada);
  }
}
