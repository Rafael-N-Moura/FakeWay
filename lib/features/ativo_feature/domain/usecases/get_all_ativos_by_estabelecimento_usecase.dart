import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/ativo_feature/domain/repositories/ativo_repository.dart';

import '../entities/ativo_entity.dart';

class GetAllAtivosByEstabelecimentoUsecase
    implements UseCase<List<Ativo>, int> {
  final IAtivoRepository repository;

  GetAllAtivosByEstabelecimentoUsecase(this.repository);

  @override
  Future<Either<Failure, List<Ativo>>> call(int estabelecimentoId) async {
    return await repository.getAllAtivosByEstabelecimento(estabelecimentoId);
  }
}
