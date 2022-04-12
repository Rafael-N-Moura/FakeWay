import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/historico_feature/domain/entities/historico_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class IHistoricoRepository {
  Future<Either<Failure, List<HistoricoEntity>>> getTotalHistorico();
  Future<Either<Failure, NoParams>> storeHistorico(HistoricoEntity historico);
}
