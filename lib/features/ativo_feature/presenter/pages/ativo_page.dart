import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/ativo_feature/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/ativo_card_widget.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/custom_ativo_app_bar_widget.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/filtro_ativo_widget.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:flutter/material.dart';

class AtivoPage extends StatelessWidget {
  const AtivoPage({Key? key}) : super(key: key);

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
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                itemCount: 20,
                itemBuilder: (_, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: AtivoCardWidget(
                        ativo: Ativo(
                            estabelecimento: Estabelecimento(
                                companyId: 1, companyName: "teste"),
                            sensorId: 1,
                            dispotividoId: 1,
                            nome: "[Nome Ativo]",
                            tipoId: 1,
                            tipoDescricao: "tipoDescricao",
                            icone: "",
                            sensores: [""],
                            latitude: 1,
                            longitude: 1)),
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
