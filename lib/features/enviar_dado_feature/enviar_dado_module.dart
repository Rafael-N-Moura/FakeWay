import 'package:fake_way/features/enviar_dado_feature/presentation/pages/enviar_dado_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnviarDadoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const EnviarDadoPage()),
      ];
}
