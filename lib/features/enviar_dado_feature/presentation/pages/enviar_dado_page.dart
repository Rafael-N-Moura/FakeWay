import 'package:fake_way/features/enviar_dado_feature/presentation/pages/dynamic_enviar_dado_page.dart';
import 'package:fake_way/features/enviar_dado_feature/presentation/pages/static_enviar_dado_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/utils/way_colors.dart';
import '../../../ativo_feature/domain/entities/ativo_entity.dart';
import '../controllers/enviar_dado_controller.dart';

class EnviarDadoPage extends StatelessWidget {
  final Ativo ativo;
  EnviarDadoPage({Key? key, required this.ativo}) : super(key: key);
  final EnviarDadoController controller = Modular.get<EnviarDadoController>();

  @override
  Widget build(BuildContext context) {
    controller.setCurrentAtivo(ativo);
    controller.setInitialCoordenada(context);

    controller.clearControllerValues();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          leading: InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () {
              Modular.to.pop();
            },
          ),
          title: Text(
            ativo.nome ?? "Ativo sem nome",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
          ),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
              indicatorWeight: 8,
              indicatorColor: WayColors.primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    'Temperatura',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Umidade',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Coordenada',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                )
              ]),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            StaticEnviarDadoPage(
              type: false,
            ),
            StaticEnviarDadoPage(
              type: true,
            ),
            const DynamicEnviarDadoPage(),
          ],
        ),
      ),
    );
  }
}
