import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/features/fake_way/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/fake_way/domain/entities/estabelecimento_entity.dart';
import 'package:fake_way/features/fake_way/domain/repositories/ativo_repository.dart';
import 'package:fake_way/features/fake_way/domain/usecases/get_all_ativos_by_estabelecimento_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAtivoRepository extends Mock implements IAtivoRepository {}

void main() {
  late GetAllAtivosByEstabelecimentoUsecase usecase;
  late IAtivoRepository repository;

  setUp(() {
    repository = MockAtivoRepository();
    usecase = GetAllAtivosByEstabelecimentoUsecase(repository);
  });

  const int tEstabelecimentoId = 1;
  const List<Ativo> tAtivosList = [
    Ativo(
        estabelecimento:
            Estabelecimento(companyId: 1, companyName: 'companyName'),
        sensorId: 1,
        dispotividoId: 1,
        nome: 'nome',
        tipoId: 1,
        tipoDescricao: 'descrição',
        icone: 'icone',
        sensores: ['sensores'],
        latitude: 1.0,
        longitude: 1.0),
  ];

  test(
      'should get a list of ativos for a given estabelecimento id from the repository',
      () async {
    when(() => repository.getAllAtivosByEstabelecimento(tEstabelecimentoId))
        .thenAnswer((_) async => const Right(tAtivosList));

    final result = await usecase(tEstabelecimentoId);

    expect(result, const Right(tAtivosList));

    verify(() => repository.getAllAtivosByEstabelecimento(tEstabelecimentoId))
        .called(1);
  });

  test('should return a ServerFailure when don\'t succeed', () async {
    when(() => repository.getAllAtivosByEstabelecimento(tEstabelecimentoId))
        .thenAnswer((_) async => Left(ServerFailure()));

    final result = await usecase(tEstabelecimentoId);

    expect(result, Left(ServerFailure()));

    verify(() => repository.getAllAtivosByEstabelecimento(tEstabelecimentoId))
        .called(1);
  });
}
