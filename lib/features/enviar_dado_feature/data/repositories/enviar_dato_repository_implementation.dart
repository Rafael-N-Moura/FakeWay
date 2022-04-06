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
      await dataSource.sendCoordenadaData(CoordenadaModel(
          dispositivoId: coordenada.dispositivoId,
          sensorId: coordenada.sensorId,
          data: coordenada.data,
          latitude: coordenada.latitude,
          longitude: coordenada.longitude,
          velocidade: coordenada.velocidade));
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> sendTemperatureData(
      Temperatura temperatura) async {
    try {
      await dataSource.sendTemperatureData(TemperaturaModel(
          dispositivoId: temperatura.dispositivoId,
          sensorId: temperatura.sensorId,
          data: temperatura.data,
          temperatura: temperatura.temperatura));
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> sendUmidadeData(Umidade umidade) async {
    try {
      await dataSource.sendUmidadeData(UmidadeModel(
          dispositivoId: umidade.dispositivoId,
          sensorId: umidade.sensorId,
          data: umidade.data,
          umidade: umidade.umidade));
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
