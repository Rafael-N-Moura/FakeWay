import 'package:fake_way/core/http_client/dio_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/data_source_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/data/repositories/estabelecimento_repository_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/pages/estabelecimento_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Estabelecimento Feature
        Bind(
          (i) => DataSourceImplementation(i()),
        ),
        Bind((i) => EstabelecimentoRepositoryImplementation(i())),
        Bind(
          (i) => GetAllEstabelecimentosUsecase(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute("/", child: (_, __) => const EstabelecimentoPage())];
}
