import 'package:fake_way/features/estabelecimento_feature/data/datasources/estabelecimento_data_source_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/data/repositories/estabelecimento_repository_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/controllers/estabelecimento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/estabelecimento_page.dart';

class EstabelecimentoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const EstabelecimentoPage()),
      ];
  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => EstabelecimentoDataSourceImplementation(i()),
        ),
        Bind((i) => EstabelecimentoRepositoryImplementation(i())),
        Bind.singleton(
          (i) => GetAllEstabelecimentosUsecase(i()),
        ),
        Bind.singleton(((i) => EstabelecimentoController(usecase: i()))),
      ];
}
