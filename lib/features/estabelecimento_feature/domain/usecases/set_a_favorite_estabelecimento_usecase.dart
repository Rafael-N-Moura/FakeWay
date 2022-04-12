import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';

import '../repositories/i_estabelecimento_repository.dart';

class SetAFavoriteEstabelecimento
    implements UseCase<NoParams, Estabelecimento> {
  final IEstabelecimentoRepository repository;

  SetAFavoriteEstabelecimento(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(
      Estabelecimento estabelecimento) async {
    return await repository.setAFavoriteEstabelecimento(estabelecimento);
  }
}
