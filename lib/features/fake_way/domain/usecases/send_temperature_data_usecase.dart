import 'package:fake_way/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/fake_way/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';

class SendTemperatureData implements UseCase<void, Temperatura> {
  final IAtivoRepository repository;

  SendTemperatureData(this.repository);

  @override
  Future<Either<Failure, void>> call(Temperatura temperatura) async {
    return await repository.sendTemperatureData(temperatura);
  }
}
