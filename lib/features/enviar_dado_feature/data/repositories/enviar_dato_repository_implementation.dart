import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/coordenada_entity.dart';
import '../../domain/entities/temperatura_entity.dart';
import '../../domain/entities/umidade_entity.dart';
import '../../domain/repositories/enviar_dado_repository.dart';
import '../datasources/data_source.dart';
import '../models/coordenata_model.dart';
import '../models/temperatura_model.dart';
import '../models/umidade_model.dart';

class EnviarDadoRepositoryImplementation implements IEnviarDadoRepository {
  final IDataSource dataSource;
  EnviarDadoRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, NoParams>> sendCoordenadaData(
      Coordenada coordenada) async {
    try {
      await dataSource.sendCoordenadaData(coordenada as CoordenadaModel);
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> sendTemperatureData(
      Temperatura temperatura) async {
    try {
      await dataSource.sendTemperatureData(temperatura as TemperaturaModel);
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> sendUmidadeData(Umidade umidade) async {
    try {
      await dataSource.sendUmidadeData(umidade as UmidadeModel);
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
