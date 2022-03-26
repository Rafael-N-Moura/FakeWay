import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/fake_way/domain/entities/coordenada_entity.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';

class SendCoordenadaData extends UseCase<void, Coordenada> {
  final IAtivoRepository repository;

  SendCoordenadaData(this.repository);
  @override
  Future<Either<Failure, dynamic>> call(Coordenada coordenada) {
    return repository.sendCoordenadaData(coordenada);
  }
}
