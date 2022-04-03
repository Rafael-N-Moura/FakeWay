import 'package:fake_way/core/utils/way_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAtivoAppBarWidget extends AppBar {
  CustomAtivoAppBarWidget({Key? key})
      : super(
          key: key,
          leading: InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                color: WayColors.primaryColor,
              ),
            ),
            onTap: () {
              Modular.to.pop();
            },
          ),
          title: const Text("Selecione o Ativo"),
          titleSpacing: 24,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: WayColors.primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: "Raleway"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.segment,
                  color: WayColors.primaryColor,
                ))
          ],
        );
}
