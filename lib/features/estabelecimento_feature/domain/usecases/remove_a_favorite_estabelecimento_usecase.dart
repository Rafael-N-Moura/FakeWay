import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';

import '../repositories/i_estabelecimento_repository.dart';

class RemoveAFavoriteEstabelecimentoUsecase implements UseCase<NoParams, int> {
  final IEstabelecimentoRepository repository;

  RemoveAFavoriteEstabelecimentoUsecase(this.repository);
  @override
  Future<Either<Failure, NoParams>> call(int companyId) async {
    return await repository.removeAFavoriteEstabelecimento(companyId);
  }
}
