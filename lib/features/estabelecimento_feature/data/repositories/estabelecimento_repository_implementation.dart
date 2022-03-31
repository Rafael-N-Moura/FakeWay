import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/i_data_source.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/repositories/i_estabelecimento_repository.dart';

class EstabelecimentoRepositoryImplementation
    implements IEstabelecimentoRepository {
  final IDataSource dataSource;

  EstabelecimentoRepositoryImplementation(this.dataSource);

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
}
