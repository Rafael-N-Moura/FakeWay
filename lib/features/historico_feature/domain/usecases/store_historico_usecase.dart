import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/historico_feature/domain/entities/historico_entity.dart';

import '../repositories/historico_repository.dart';

class StoreHistoricoUsecase implements UseCase<NoParams, HistoricoEntity> {
  final IHistoricoRepository repository;

  StoreHistoricoUsecase(this.repository);
  @override
  Future<Either<Failure, NoParams>> call(HistoricoEntity historico) async {
    return await repository.storeHistorico(historico);
  }
}
