import 'package:fake_way/features/estabelecimento_feature/presenter/controllers/estabelecimento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/estabelecimento_page.dart';

class EstabelecimentoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => EstabelecimentoPage()),
      ];
  @override
  List<Bind<Object>> get binds => [];
}
