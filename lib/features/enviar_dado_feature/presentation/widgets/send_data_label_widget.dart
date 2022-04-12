import 'package:flutter/material.dart';

import '../../../../core/utils/way_colors.dart';

class SendDataLabelWidget extends StatelessWidget {
  const SendDataLabelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Text(
          'Enviando os seguintes dados',
          style: TextStyle(color: WayColors.primaryColor, fontSize: 20),
        ),
      ),
    );
  }
}
