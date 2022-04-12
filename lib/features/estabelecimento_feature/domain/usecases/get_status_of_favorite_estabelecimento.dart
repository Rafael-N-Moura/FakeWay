import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';

import '../repositories/i_estabelecimento_repository.dart';

class GetStatusOfFavoriteEstabelecimentoUsecase implements UseCase<bool, int> {
  final IEstabelecimentoRepository repository;

  GetStatusOfFavoriteEstabelecimentoUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(int companyId) async {
    return await repository.getStatusOfFavoriteEstabelecimento(companyId);
  }
}
