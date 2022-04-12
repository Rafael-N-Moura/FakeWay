import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/estabelecimento_feature/presenter/controllers/estabelecimento_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomAppBarWidget extends AppBar {
  final EstabelecimentoController controller;
  CustomAppBarWidget({Key? key, required this.controller})
      : super(
          key: key,
          title: const Text("Selecione a Empresa"),
          titleSpacing: 24,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: WayColors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: "Raleway",
          ),
          actions: [
            Row(
              children: [
                Observer(
                  builder: (_) {
                    return IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        controller.favoritesOn
                            ? controller.getAllEstabelecimentos()
                            : controller.getAllFavoritesEstabelecimentos();
                      },
                      icon: Icon(Icons.star,
                          color: controller.favoritesOn
                              ? WayColors.primaryColor
                              : WayColors.grey),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {
                    controller.sortList();
                  },
                  icon: Icon(
                    Icons.segment,
                    color: WayColors.primaryColor,
                  ),
                ),
              ],
            )
          ],
        );
}
