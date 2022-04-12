import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/temperatura_model.dart';
import 'package:fake_way/features/historico_feature/data/models/historico_model.dart';
import 'package:fake_way/features/historico_feature/domain/entities/historico_entity.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/features/historico_feature/domain/repositories/historico_repository.dart';

import '../../../enviar_dado_feature/data/models/coordenata_model.dart';
import '../../../enviar_dado_feature/data/models/umidade_model.dart';
import '../datasources/historico_data_source.dart';

class HistoricoRepositoryImplementation implements IHistoricoRepository {
  final IHistoricoDataSource dataSource;

  HistoricoRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, List<HistoricoEntity>>> getTotalHistorico() async {
    try {
      final result = await dataSource.getTotalHistorico();
      return Right(result);
    } on LocalDatabaseException {
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> storeHistorico(
      HistoricoEntity historico) async {
    try {
      final result = await dataSource.storeHistorico(
        HistoricoModel(
          ativo: historico.ativo,
          type: historico.type,
          temperatura: historico.temperatura == null
              ? null
              : TemperaturaModel(
                  dispositivoId: historico.temperatura!.dispositivoId,
                  sensorId: historico.temperatura!.sensorId,
                  data: historico.temperatura!.data,
                  temperatura: historico.temperatura!.temperatura,
                ),
          umidade: historico.umidade == null
              ? null
              : UmidadeModel(
                  dispositivoId: historico.umidade!.dispositivoId,
                  sensorId: historico.umidade!.sensorId,
                  data: historico.umidade!.data,
                  umidade: historico.umidade!.umidade,
                ),
          coordenada: historico.coordenada == null
              ? null
              : CoordenadaModel(
                  dispositivoId: historico.coordenada!.dispositivoId,
                  sensorId: historico.coordenada!.sensorId,
                  data: historico.coordenada!.data,
                  latitude: historico.coordenada!.latitude,
                  longitude: historico.coordenada!.longitude,
                  velocidade: historico.coordenada!.velocidade),
        ),
      );
      return Right(NoParams());
    } on LocalDatabaseException {
      return Left(LocalDatabaseFailure());
    }
  }
}
