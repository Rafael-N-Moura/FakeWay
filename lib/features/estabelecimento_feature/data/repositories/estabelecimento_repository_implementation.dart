import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/estabelecimento_local_data_source.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/i_estabelecimento_data_source.dart';
import 'package:fake_way/features/estabelecimento_feature/data/models/estabelecimento_model.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/repositories/i_estabelecimento_repository.dart';

class EstabelecimentoRepositoryImplementation
    implements IEstabelecimentoRepository {
  final IEstabelecimentoDataSource dataSource;
  final IEstabelecimentoLocalDataSource localDataSource;

  EstabelecimentoRepositoryImplementation(
      this.dataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<Estabelecimento>>>
      getAllEstabelecimentos() async {
    try {
      final result = await dataSource.getAllEstabelecimentos();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Estabelecimento>>>
      getAllFavoritesEstabelecimentos() async {
    try {
      final result = await localDataSource.getAllFavoritesEstabelecimentos();
      return Right(result);
    } on LocalDatabaseException {
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> setAFavoriteEstabelecimento(
      Estabelecimento estabelecimento) async {
    try {
      final result = await localDataSource.setAFavoriteEstabelecimento(
        EstabelecimentoModel(
            companyId: estabelecimento.companyId,
            companyName: estabelecimento.companyName),
      );
      return Right(result);
    } on LocalDatabaseException {
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> removeAFavoriteEstabelecimento(
      int companyId) async {
    try {
      final result =
          await localDataSource.removeAFavoriteEstabelecimento(companyId);
      return Right(result);
    } on LocalDatabaseException {
      return Left(LocalDatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> getStatusOfFavoriteEstabelecimento(
      int companyId) async {
    try {
      final result =
          await localDataSource.getStatusOfFavoriteEstabelecimento(companyId);
      return Right(result);
    } on LocalDatabaseException {
      return Left(LocalDatabaseFailure());
    }
  }
}
