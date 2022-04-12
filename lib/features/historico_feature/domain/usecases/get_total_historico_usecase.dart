import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/historico_feature/domain/entities/historico_entity.dart';
import 'package:fake_way/features/historico_feature/domain/repositories/historico_repository.dart';

class GetTotalHistoryUsecase
    implements UseCase<List<HistoricoEntity>, NoParams> {
  final IHistoricoRepository repository;

  GetTotalHistoryUsecase(this.repository);
  @override
  Future<Either<Failure, List<HistoricoEntity>>> call(NoParams noParams) async {
    return await repository.getTotalHistorico();
  }
}
