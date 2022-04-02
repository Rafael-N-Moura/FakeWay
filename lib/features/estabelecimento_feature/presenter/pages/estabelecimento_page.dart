import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/widgets/custom_app_bar_widget.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/widgets/estabelecimento_card_widget.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/widgets/filtro_estabelecimento_widget.dart';
import 'package:flutter/material.dart';

class EstabelecimentoPage extends StatelessWidget {
  const EstabelecimentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(),
      body: Column(
        children: [
          const FiltroEstabelecimentoWidget(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 12),
              color: WayColors.primaryLight,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (_, index) {
                  return EstabelecimentoCardWidget(
                      estabelecimento: Estabelecimento(
                          companyId: index,
                          companyName: "Empresa teste $index"));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
