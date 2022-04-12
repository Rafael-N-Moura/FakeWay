import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/core/widgets/empty_list_widget.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/widgets/custom_app_bar_widget.dart';
import 'package:fake_way/core/widgets/error_get_list_widget.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/widgets/estabelecimento_card_widget.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/widgets/filtro_estabelecimento_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/estabelecimento_controller.dart';
import '../widgets/historico_button_widget.dart';

class EstabelecimentoPage extends StatefulWidget {
  const EstabelecimentoPage({Key? key}) : super(key: key);

  @override
  State<EstabelecimentoPage> createState() => _EstabelecimentoPageState();
}

class _EstabelecimentoPageState extends State<EstabelecimentoPage> {
  final EstabelecimentoController controller =
      Modular.get<EstabelecimentoController>();

  @override
  void initState() {
    controller.getAllEstabelecimentos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(controller: controller),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FiltroEstabelecimentoWidget(controller: controller),
          const HistoricoButtonWidget(),
          Expanded(
            child: Container(
              color: WayColors.primaryLight,
              child: Observer(
                builder: (context) {
                  return controller.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: WayColors.primaryColor,
                          ),
                        )
                      : controller.estabelecimentos == null
                          ? const ErrorGetListWidget(
                              textError:
                                  "Não foi possível carregar \na lista de Estabelecimentos!",
                            )
                          : controller.listFiltered.isEmpty
                              ? const EmptyListWidget()
                              : ListView.builder(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, top: 24),
                                  itemCount: controller.listFiltered.length,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 24),
                                      child: EstabelecimentoCardWidget(
                                        estabelecimento:
                                            controller.listFiltered[index],
                                      ),
                                    );
                                  },
                                );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
