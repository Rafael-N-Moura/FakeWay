import 'package:fake_way/features/ativo_feature/data/datasources/ativo_data_source_implementation.dart';
import 'package:fake_way/features/ativo_feature/data/repositories/ativo_repository_implementation.dart';
import 'package:fake_way/features/ativo_feature/domain/usecases/get_all_ativos_by_estabelecimento_usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/data/datasources/data_source_implementation.dart';
import 'package:fake_way/features/enviar_dado_feature/data/repositories/enviar_dato_repository_implementation.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_temperature_data_usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_umidade_data_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/estabelecimento_data_source_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/data/repositories/estabelecimento_repository_implementation.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/usecases/get_all_estabelecimentos_usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/establecimento_module.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/controllers/estabelecimento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/http_client/dio_implementation.dart';
import 'core/http_client/http_client.dart';
import 'features/ativo_feature/ativo_module.dart';
import 'features/ativo_feature/presenter/controllers/ativo_controller.dart';
import 'features/enviar_dado_feature/domain/usecases/send_coordenada_data_usecase.dart';
import 'features/enviar_dado_feature/enviar_dado_module.dart';
import 'features/enviar_dado_feature/presentation/controllers/enviar_dado_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<HttpClient>((i) => DioImplementation()),
        //Estabelecimento Feature
        Bind(
          (i) => EstabelecimentoDataSourceImplementation(i()),
        ),
        Bind((i) => EstabelecimentoRepositoryImplementation(i())),
        Bind.singleton(
          (i) => GetAllEstabelecimentosUsecase(i()),
        ),
        Bind.singleton(((i) => EstabelecimentoController(usecase: i()))),

        //Ativo Feature
        Bind(
          (i) => AtivoDataSourceImplementation(i()),
        ),
        Bind((i) => AtivoRepositoryImplementation(i())),
        Bind(
          (i) => GetAllAtivosByEstabelecimentoUsecase(i()),
        ),
        Bind.singleton(((i) => AtivoController(usecase: i()))),

        //Enviar Dado Feature
        Bind.singleton(((i) => EnviarDadoController(
            sendTemperatureUsecase: i(),
            sendUmidadeUsecase: i(),
            sendCoordenadaUsecase: i()))),
        Bind(((i) => SendTemperatureData(i()))),
        Bind(((i) => SendUmidadeDataUsecase(i()))),
        Bind(((i) => SendCoordenadaData(i()))),
        Bind((i) => EnviarDadoRepositoryImplementation(i())),
        Bind(
          (i) => DataSourceImplementation(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: EstabelecimentoModule()),
        ModuleRoute('/ativo-module',
            module: AtivoModule(),
            transition: TransitionType.rightToLeftWithFade),
        ModuleRoute('/enviar-dado-module',
            module: EnviarDadoModule(),
            transition: TransitionType.rightToLeftWithFade),
      ];
}
