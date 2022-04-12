import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/features/ativo_feature/domain/usecases/get_all_ativos_by_estabelecimento_usecase.dart';
import 'package:fake_way/features/ativo_feature/presenter/controllers/ativo_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/estabelecimento_id_mock.dart';
import '../../../mocks/lista_de_ativos_mock.dart';

class MockGetAllAtivosUsecase extends Mock
    implements GetAllAtivosByEstabelecimentoUsecase {}

main() {
  late AtivoController controller;
  late GetAllAtivosByEstabelecimentoUsecase usecase;

  setUp(() {
    usecase = MockGetAllAtivosUsecase();
    controller = AtivoController(usecase: usecase);
  });

  test("should return a list of ativos from the usecase", () async {
    // Arrange
    when(() => usecase(tEstabelecimentoId))
        .thenAnswer((_) async => const Right(tAtivoList));
    // Act
    await controller.getAllAtivos(tEstabelecimentoId);
    // Assert
    expect(controller.ativos, tAtivoList);
    //verify(() => controller.getAllAtivos(tEstabelecimentoId)).called(1);
  });

  test("should return a null List from the usecase when dont successful",
      () async {
    // Arrange
    when(() => usecase(tEstabelecimentoId))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    await controller.getAllAtivos(tEstabelecimentoId);
    // Assert
    expect(controller.ativos, null);
    //verify(() => controller.getAllAtivos(tEstabelecimentoId)).called(1);
  });
}
