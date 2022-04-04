import 'package:fake_way/features/enviar_dado_feature/presentation/widgets/value_picker_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/utils/way_colors.dart';
import '../controllers/enviar_dado_controller.dart';

class ValuePickerWidget extends StatelessWidget {
  ValuePickerWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  // false -> Temperatura
  // true -> Umidade
  final bool type;
  final EnviarDadoController controller = Modular.get<EnviarDadoController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WayColors.primaryLight,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Observer(builder: (_) {
              return Text(
                type
                    ? '${controller.currentUmidade} %RH'
                    : '${controller.currentTemperatura} C',
                style: TextStyle(
                    color: WayColors.primaryColor,
                    fontSize: 16,
                    fontFamily: 'Sansation',
                    fontWeight: FontWeight.w700),
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValuePickerComponentWidget(
                label1: '-1',
                label2: '-0.5',
                function1: type
                    ? () => controller.increaseUmidade(-1)
                    : () => controller.increaseTemperatura(-1),
                function2: type
                    ? () => controller.increaseUmidade(-0.5)
                    : () => controller.increaseTemperatura(-0.5),
              ),
              ValuePickerComponentWidget(
                label1: '+0.5',
                label2: '+1',
                function1: type
                    ? () => controller.increaseUmidade(0.5)
                    : () => controller.increaseTemperatura(0.5),
                function2: type
                    ? () => controller.increaseUmidade(1)
                    : () => controller.increaseTemperatura(1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
