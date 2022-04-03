import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/ativo_feature/domain/entities/ativo_entity.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/ativo_card_widget.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/custom_ativo_app_bar_widget.dart';
import 'package:fake_way/features/ativo_feature/presenter/widgets/filtro_ativo_widget.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:flutter/material.dart';

class AtivoPage extends StatelessWidget {
  final Estabelecimento estabelecimento;
  const AtivoPage({Key? key, required this.estabelecimento}) : super(key: key);

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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: AtivoCardWidget(
                        ativo: Ativo(
                            estabelecimento: estabelecimento,
                            sensorId: 1,
                            dispotividoId: 1,
                            nome: "[Nome Ativo]",
                            tipoId: 1,
                            tipoDescricao: "tipoDescricao",
                            icone: "",
                            sensores: const [""],
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
