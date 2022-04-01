import 'package:fake_way/core/utils/way_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends AppBar {
  CustomAppBarWidget({Key? key})
      : super(
          key: key,
          title: const Text("Selecione a Empresa"),
          titleSpacing: 24,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: WayColors.grey, fontSize: 20, fontWeight: FontWeight.w500),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.align_horizontal_right_rounded,
                  color: WayColors.primaryColor,
                ))
          ],
        );
}
