import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class IEstabelecimentoRepository {
  Future<Either<Failure, List<Estabelecimento>>> getAllEstabelecimentos();
  Future<Either<Failure, List<Estabelecimento>>>
      getAllFavoritesEstabelecimentos();
  Future<Either<Failure, NoParams>> setAFavoriteEstabelecimento(
      Estabelecimento estabelecimento);
  Future<Either<Failure, NoParams>> removeAFavoriteEstabelecimento(
      int companyId);
    Future<Either<Failure, bool>> getStatusOfFavoriteEstabelecimento(int companyId);
}
