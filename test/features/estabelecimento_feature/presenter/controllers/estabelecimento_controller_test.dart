import 'package:dartz/dartz.dart';
import 'package:fake_way/core/errors/failures.dart';
import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/controllers/estabelecimento_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/lista_de_estabelecimentos_mock.dart';

class MockGetAllEstabelecimentosUsecase extends Mock
    implements GetAllEstabelecimentosUsecase {}

main() {
  late EstabelecimentoController controller;
  late GetAllEstabelecimentosUsecase usecase;

  setUp(() {
    usecase = MockGetAllEstabelecimentosUsecase();
    controller = EstabelecimentoController(usecase: usecase);
  });

  test("should return a list of estabelecimentos from the usecase", () async {
    // Arrange
    when(() => usecase(NoParams()))
        .thenAnswer((_) async => const Right(tListEstabelecimentoMock));
    // Act
    await controller.getAllEstabelecimentos();
    // Assert
    expect(controller.estabelecimentos, tListEstabelecimentoMock);
    //verify(() => controller.getAllEstabelecimentos()).called(1);
  });

  test("should return a null List from the usecase when dont successful",
      () async {
    // Arrange
    when(() => usecase(NoParams()))
        .thenAnswer((_) async => Left(ServerFailure()));
    // Act
    await controller.getAllEstabelecimentos();
    // Assert
    expect(controller.estabelecimentos, null);
    //verify(() => controller.getAllEstabelecimentos()).called(1);
  });
}
