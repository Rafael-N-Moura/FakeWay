import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/coordenata_model.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/temperatura_model.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/umidade_model.dart';
import 'package:fake_way/features/fake_way/domain/entities/ativo_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../enviar_dato_feature.dart/domain/entities/coordenada_entity.dart';

abstract class IAtivoRepository {
  Future<Either<Failure, List<Ativo>>> getAllAtivosByEstabelecimento(
      int estabelecimentoId);
  Future<Either<Failure, NoParams>> sendTemperatureData(
      TemperaturaModel temperatura);
  Future<Either<Failure, NoParams>> sendUmidadeData(UmidadeModel umidade);
  Future<Either<Failure, NoParams>> sendCoordenadaData(
      Coordenada coordenada);
}
