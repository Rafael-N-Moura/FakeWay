import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/features/ativo_feature/data/datasources/i_ativo_data_source.dart';
import 'package:fake_way/features/ativo_feature/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/ativo_feature/domain/repositories/ativo_repository.dart';

class AtivoRepositoryImplementation implements IAtivoRepository {
  final IAtivoDataSource dataSource;
  AtivoRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, List<Ativo>>> getAllAtivosByEstabelecimento(
      int estabelecimentoId) async {
    try {
      final result =
          await dataSource.getAllAtivosByEstabelecimento(estabelecimentoId);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
