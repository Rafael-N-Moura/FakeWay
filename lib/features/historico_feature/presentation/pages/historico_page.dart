import 'package:fake_way/features/historico_feature/presentation/widgets/custom_historico_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/way_colors.dart';
import '../../../../core/widgets/empty_list_widget.dart';
import '../../../../core/widgets/error_get_list_widget.dart';
import '../controllers/historico_controller.dart';
import '../widgets/historico_card_widget.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  final HistoricoController controller = Modular.get<HistoricoController>();

  @override
  void initState() {
    controller.getTotalHistorico();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HistoricoPage oldWidget) {
    controller.getTotalHistorico();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHistoricoAppBarWidget(),
      body: Column(
        children: [
          HistoricoSearchBar(),
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
                      : controller.historico == null
                          ? const ErrorGetListWidget(
                              textError:
                                  "Não foi possível carregar o Histórico!",
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
                                      child: HistoricoCardWidget(
                                        historico:
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

class HistoricoSearchBar extends StatelessWidget {
  HistoricoSearchBar({
    Key? key,
  }) : super(key: key);

  final HistoricoController controller = Modular.get<HistoricoController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: WayColors.greyLight,
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
        child: TextField(
          onChanged: controller.setFilter,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: WayColors.grey,
            ),
            hintText: "Procurar no histórico",
            hintStyle: TextStyle(color: WayColors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
