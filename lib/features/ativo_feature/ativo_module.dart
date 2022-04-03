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
}
