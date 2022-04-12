import 'package:fake_way/features/enviar_dado_feature/data/datasources/data_source_implementation.dart';
import 'package:fake_way/features/enviar_dado_feature/data/repositories/enviar_dato_repository_implementation.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_coordenada_data_usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_temperature_data_usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_umidade_data_usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/presentation/controllers/enviar_dado_controller.dart';
import 'package:fake_way/features/enviar_dado_feature/presentation/pages/enviar_dado_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnviarDadoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => EnviarDadoPage(
            ativo: args.data,
          ),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton(
            ((i) => EnviarDadoController(
                sendTemperatureUsecase: i(),
                sendUmidadeUsecase: i(),
                sendCoordenadaUsecase: i())),
            export: true),
        Bind(((i) => SendTemperatureData(i())), export: true),
        Bind(((i) => SendUmidadeDataUsecase(i())), export: true),
        Bind(((i) => SendCoordenadaData(i())), export: true),
        Bind((i) => EnviarDadoRepositoryImplementation(i()), export: true),
        Bind((i) => DataSourceImplementation(i()), export: true),
      ];
}
