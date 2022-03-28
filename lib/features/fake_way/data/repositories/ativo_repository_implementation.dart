import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/features/fake_way/data/datasource/i_data_source.dart';
import 'package:fake_way/features/fake_way/domain/entities/umidade_entity.dart';
import 'package:fake_way/features/fake_way/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/fake_way/domain/entities/coordenada_entity.dart';
import 'package:fake_way/features/fake_way/domain/entities/ativo_entity.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';

class AtivoRepositoryImplementation implements IAtivoRepository {
  final IDataSource dataSource;
  AtivoRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, List<Ativo>>> getAllAtivosByEstabelecimento(
      int estabelecimentoId) async {
    try {
      final result =
          await dataSource.getAllAtivosByEstabelecimento(estabelecimentoId);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> sendCoordenadaData(Coordenada coordenada) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> sendTemperatureData(
      Temperatura temperatura) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> sendUmidadeData(Umidade umidade) {
    throw UnimplementedError();
  }
}
