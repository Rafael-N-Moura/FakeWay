import 'package:dartz/dartz.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/entities/coordenada_entity.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/entities/umidade_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

abstract class IEnviarDadoRepository {
  Future<Either<Failure, NoParams>> sendTemperatureData(
      Temperatura temperatura);
  Future<Either<Failure, NoParams>> sendUmidadeData(Umidade umidade);
  Future<Either<Failure, NoParams>> sendCoordenadaData(Coordenada coordenada);
}
