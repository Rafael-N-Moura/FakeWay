import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/umidade_model.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/repositories/enviar_dado_repository.dart';

class SendUmidadeDataUsecase implements UseCase<NoParams, UmidadeModel> {
  final IEnviarDadoRepository repository;

  SendUmidadeDataUsecase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(UmidadeModel umidade) async {
    return await repository.sendUmidadeData(umidade);
  }
}
