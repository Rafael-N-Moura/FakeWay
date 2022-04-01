import 'package:fake_way/core/utils/way_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Selecione a Empresa"),
      titleTextStyle: TextStyle(
          color: WayColors.grey,
          fontSize: 20,
          height: 20,
          fontWeight: FontWeight.w500),
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
}
