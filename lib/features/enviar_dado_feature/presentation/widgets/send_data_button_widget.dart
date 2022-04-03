import 'package:flutter/material.dart';

import '../../../../core/utils/way_colors.dart';

class SendDataButtonWidget extends StatelessWidget {
  const SendDataButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Enviar Dados',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      height: 48,
      width: 208,
      decoration: BoxDecoration(
          color: WayColors.primaryColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
