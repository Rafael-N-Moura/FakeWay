import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/repositories/enviar_dado_repository.dart';

import '../entities/umidade_entity.dart';

class SendUmidadeDataUsecase implements UseCase<NoParams, Umidade> {
  final IEnviarDadoRepository repository;

  SendUmidadeDataUsecase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(Umidade umidade) async {
    return await repository.sendUmidadeData(umidade);
  }
}
