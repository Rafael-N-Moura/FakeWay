import 'package:dartz/dartz.dart';
import 'package:fake_way/features/fake_way/domain/entities/estabelecimento_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class IEstabelecimentoRepository {
  Future<Either<Failure, List<Estabelecimento>>> getAllEstabelecimentos();
}
