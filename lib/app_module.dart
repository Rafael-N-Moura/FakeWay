import 'package:fake_way/features/ativo_feature/data/datasources/ativo_data_source_implementation.dart';
import 'package:fake_way/features/ativo_feature/data/repositories/ativo_repository_implementation.dart';
import 'package:fake_way/features/ativo_feature/domain/usecases/get_all_ativos_by_estabelecimento_usecase.dart';
import 'package:fake_way/features/ativo_feature/presenter/pages/ativo_page.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/estabelecimento_data_source_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/data/repositories/estabelecimento_repository_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/pages/estabelecimento_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Estabelecimento Feature
        Bind(
          (i) => EstabelecimentoDataSourceImplementation(i()),
        ),
        Bind((i) => EstabelecimentoRepositoryImplementation(i())),
        Bind(
          (i) => GetAllEstabelecimentosUsecase(i()),
        ),

        //Ativo Feature
        Bind(
          (i) => AtivoDataSourceImplementation(i()),
        ),
        Bind((i) => AtivoRepositoryImplementation(i())),
        Bind(
          (i) => GetAllAtivosByEstabelecimentoUsecase(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const EstabelecimentoPage()),
        ChildRoute("/ativo", child: (_, __) => const AtivoPage()),
      ];
}
