import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/ativo_feature/presenter/controllers/ativo_controller.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/ativo_card_widget.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/custom_ativo_app_bar_widget.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/filtro_ativo_widget.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AtivoPage extends StatefulWidget {
  final Estabelecimento estabelecimento;
  const AtivoPage({Key? key, required this.estabelecimento}) : super(key: key);

  @override
  State<AtivoPage> createState() => _AtivoPageState();
}

class _AtivoPageState extends State<AtivoPage> {
  final AtivoController controller = Modular.get<AtivoController>();

  @override
  void initState() {
    controller.getAllAtivos(widget.estabelecimento.companyId);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AtivoPage oldWidget) {
    controller.getAllAtivos(widget.estabelecimento.companyId);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAtivoAppBarWidget(),
      body: Column(
        children: [
          const FiltroAtivoWidget(),
          Expanded(
            child: Container(
              color: WayColors.primaryLight,
              child: Observer(builder: (_) {
                return controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: WayColors.primaryColor,
                        ),
                      )
                    : ListView.builder(
                        padding:
                            const EdgeInsets.only(left: 24, right: 24, top: 24),
                        itemCount: controller.ativos.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: AtivoCardWidget(
                              ativo: controller.ativos[index],
                            ),
                          );
                        },
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
