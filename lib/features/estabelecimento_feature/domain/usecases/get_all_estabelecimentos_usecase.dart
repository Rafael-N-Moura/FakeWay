import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/repositories/i_estabelecimento_repository.dart';

class GetAllEstabelecimentosUsecase
    implements UseCase<List<Estabelecimento>, NoParams> {
  final IEstabelecimentoRepository repository;

  GetAllEstabelecimentosUsecase(this.repository);
  @override
  Future<Either<Failure, List<Estabelecimento>>> call(NoParams params) async {
    return await repository.getAllEstabelecimentos();
  }
}
