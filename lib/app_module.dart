import 'package:fake_way/features/estabelecimento_feature/establecimento_module.dart';
import 'package:fake_way/features/historico_feature/historico_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/http_client/dio_implementation.dart';
import 'core/http_client/http_client.dart';
import 'features/ativo_feature/ativo_module.dart';
import 'features/enviar_dado_feature/enviar_dado_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<HttpClient>((i) => DioImplementation()),
      ];
  @override
  List<Module> get imports => [
        HistoricoModule(),
        EnviarDadoModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: EstabelecimentoModule()),
        ModuleRoute(
          '/ativo-module',
          module: AtivoModule(),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ModuleRoute(
          '/enviar-dado-module',
          module: EnviarDadoModule(),
          transition: TransitionType.rightToLeftWithFade,
        ),
        ModuleRoute(
          '/historico-module',
          module: HistoricoModule(),
          transition: TransitionType.rightToLeftWithFade,
        ),
      ];
}
