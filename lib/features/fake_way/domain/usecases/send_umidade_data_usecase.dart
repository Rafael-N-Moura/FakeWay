import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/fake_way/domain/entities/umidade_entity.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';

class SendUmidadeDataUsecase implements UseCase<NoParams, Umidade> {
  final IAtivoRepository repository;

  SendUmidadeDataUsecase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(Umidade umidade) async {
    return await repository.sendUmidadeData(umidade);
  }
}
