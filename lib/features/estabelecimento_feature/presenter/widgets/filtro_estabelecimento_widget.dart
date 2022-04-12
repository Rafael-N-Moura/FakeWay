import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/controllers/estabelecimento_controller.dart';
import 'package:flutter/material.dart';

class FiltroEstabelecimentoWidget extends StatelessWidget {
  final EstabelecimentoController controller;
  const FiltroEstabelecimentoWidget({Key? key, required this.controller})
      : super(key: key);

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
            hintText: "Procurar empresa",
            hintStyle: TextStyle(color: WayColors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
