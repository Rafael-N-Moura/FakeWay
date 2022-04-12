import 'package:fake_way/features/ativo_feature/data/datasources/ativo_data_source_implementation.dart';
import 'package:fake_way/features/ativo_feature/data/repositories/ativo_repository_implementation.dart';
import 'package:fake_way/features/ativo_feature/domain/usecases/get_all_ativos_by_estabelecimento_usecase.dart';
import 'package:fake_way/features/ativo_feature/presenter/controllers/ativo_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/ativo_page.dart';

class AtivoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, args) => AtivoPage(
                  estabelecimento: args.data,
                )),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => AtivoDataSourceImplementation(i()),
        ),
        Bind((i) => AtivoRepositoryImplementation(i())),
        Bind(
          (i) => GetAllAtivosByEstabelecimentoUsecase(i()),
        ),
        Bind.singleton(((i) => AtivoController(usecase: i()))),
      ];
}
