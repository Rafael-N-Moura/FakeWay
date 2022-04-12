import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';

import '../entities/estabelecimento_entity.dart';
import '../repositories/i_estabelecimento_repository.dart';

class GetAllFavoritesEstabelecimentos
    implements UseCase<List<Estabelecimento>, NoParams> {
  final IEstabelecimentoRepository repository;

  GetAllFavoritesEstabelecimentos(this.repository);
  @override
  Future<Either<Failure, List<Estabelecimento>>> call(NoParams params) async {
    return await repository.getAllFavoritesEstabelecimentos();
  }
}
