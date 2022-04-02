import 'package:fake_way/core/utils/way_colors.dart';
import 'package:flutter/material.dart';

class CustomAtivoAppBarWidget extends AppBar {
  CustomAtivoAppBarWidget({Key? key})
      : super(
          key: key,
          title: const Text("Selecione o Ativo"),
          titleSpacing: 24,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: WayColors.grey,
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
