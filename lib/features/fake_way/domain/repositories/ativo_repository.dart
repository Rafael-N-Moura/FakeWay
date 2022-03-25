import 'package:dartz/dartz.dart';
import 'package:fake_way/features/fake_way/domain/entities/ativo_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class IAtivoRepository {
  Future<Either<Failure, List<Ativo>>> getAllAtivosByEstabelecimento(
      int estabelecimentoId);
}
