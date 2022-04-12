import 'package:fake_way/core/utils/way_colors.dart';
import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/empty_list_icon.png',
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Nenhum resultado encontrado',
          style: TextStyle(
            color: WayColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
