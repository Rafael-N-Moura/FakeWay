import 'package:fake_way/features/enviar_dato_feature.dart/presentation/widgets/value_picker_component_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class ValuePickerWidget extends StatelessWidget {
  const ValuePickerWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  // false -> Temperatura
  // true -> Umidade
  final bool type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.primaryLight,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            '1.5 ${type ? '%RH' : 'ºC'}',
            style: TextStyle(
                color: CustomColors.primaryColor,
                fontSize: 16,
                fontFamily: 'Sansation',
                fontWeight: FontWeight.w700),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ValuePickerComponentWidget(label1: '-1', label2: '-0.5'),
            ValuePickerComponentWidget(label1: '+0.5', label2: '+1'),
          ],
        ),
      ]),
    );
  }
}
