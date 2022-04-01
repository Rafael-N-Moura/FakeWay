import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/umidade_model.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';

class SendUmidadeDataUsecase implements UseCase<NoParams, UmidadeModel> {
  final IAtivoRepository repository;

  SendUmidadeDataUsecase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(UmidadeModel umidade) async {
    return await repository.sendUmidadeData(umidade);
  }
}
