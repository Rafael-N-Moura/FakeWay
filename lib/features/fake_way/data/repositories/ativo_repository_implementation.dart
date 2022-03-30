import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/features/fake_way/data/datasources/i_data_source.dart';
import 'package:fake_way/features/fake_way/data/models/coordenata_model.dart';
import 'package:fake_way/features/fake_way/data/models/umidade_model.dart';
import 'package:fake_way/features/fake_way/domain/entities/ativo_entity.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';

import '../models/temperatura_model.dart';

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
  Future<Either<Failure, NoParams>> sendCoordenadaData(
      CoordenadaModel coordenada) async {
    try {
      await dataSource.sendCoordenadaData(coordenada);
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> sendTemperatureData(
      TemperaturaModel temperatura) async {
    try {
      await dataSource.sendTemperatureData(temperatura);
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> sendUmidadeData(
      UmidadeModel umidade) async {
    try {
      await dataSource.sendUmidadeData(umidade);
      return Right(NoParams());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
