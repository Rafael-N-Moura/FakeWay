import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/estabelecimento_page.dart';

class EstabelecimentoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const EstabelecimentoPage()),
      ];
}
