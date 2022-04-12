import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/way_colors.dart';

class HistoricoButtonWidget extends StatelessWidget {
  const HistoricoButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/historico-module/');
      },
      child: Card(
        color: WayColors.primaryColor,
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 30),
          child: Text(
            'Histórico',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
