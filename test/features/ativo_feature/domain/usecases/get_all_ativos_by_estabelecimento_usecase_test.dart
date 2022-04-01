import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/features/ativo_feature/domain/repositories/ativo_repository.dart';
import 'package:fake_way/features/ativo_feature/domain/usecases/get_all_ativos_by_estabelecimento_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/ativo_repository_mock.dart';
import '../../../../mocks/estabelecimento_id_mock.dart';
import '../../../../mocks/lista_de_ativos_mock.dart';

void main() {
  late GetAllAtivosByEstabelecimentoUsecase usecase;
  late IAtivoRepository repository;

  setUp(() {
    repository = MockAtivoRepository();
    usecase = GetAllAtivosByEstabelecimentoUsecase(repository);
  });

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
