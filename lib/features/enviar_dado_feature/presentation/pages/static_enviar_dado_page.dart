import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/way_colors.dart';
import '../controllers/enviar_dado_controller.dart';
import '../widgets/custom_table_calendar.dart';
import '../widgets/send_data_button_widget.dart';
import '../widgets/send_data_label_widget.dart';
import '../widgets/value_picker_widget.dart';

class StaticEnviarDadoPage extends StatelessWidget {
  StaticEnviarDadoPage({
    Key? key,
    required this.type,
  }) : super(key: key);

  // false -> Temperatura
  // true -> Umidade
  final bool type;

  final EnviarDadoController controller = Modular.get<EnviarDadoController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTableCalendar(type: type ? 'umidade' : 'temperatura'),
          ValuePickerWidget(
            type: type,
          ),
          const SendDataLabelWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sensor',
                      style: TextStyle(
                        color: WayColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      controller.currentAtivo!.sensorId.toString(),
                      style: TextStyle(
                        fontFamily: 'Sansation',
                        color: WayColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Data',
                      style: TextStyle(
                        color: WayColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Observer(builder: (_) {
                      return Text(
                        type
                            ? "${controller.currentUmidadeDate.day}/${controller.currentUmidadeDate.month}/${controller.currentUmidadeDate.year}"
                            : "${controller.currentTemperaturaDate.day}/${controller.currentTemperaturaDate.month}/${controller.currentTemperaturaDate.year}",
                        style: TextStyle(
                            fontFamily: 'Sansation',
                            color: WayColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      );
                    }),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      type ? 'Umidade' : 'Temperatura',
                      style: TextStyle(
                          color: WayColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Observer(builder: (_) {
                      return Text(
                        type
                            ? controller.currentUmidade.toString()
                            : controller.currentTemperatura.toString(),
                        style: TextStyle(
                          fontFamily: 'Sansation',
                          color: WayColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SendDataButtonWidget(
            function: type
                ? () => controller.sendUmidadeaData(context)
                : () => controller.sendTemperaturaData(context),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
