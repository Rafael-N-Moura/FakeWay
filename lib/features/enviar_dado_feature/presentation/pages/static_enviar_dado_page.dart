import 'package:fake_way/features/enviar_dado_feature/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/umidade_entity.dart';
import 'package:fake_way/features/historico_feature/domain/entities/historico_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/way_colors.dart';
import '../../../historico_feature/presentation/controllers/historico_controller.dart';
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
  final HistoricoController historicoController =
      Modular.get<HistoricoController>();

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
                ? () {
                    controller.sendUmidadeaData(context);
                    historicoController.storeHistorico(
                      HistoricoEntity(
                        ativo: controller.currentAtivo!,
                        type: 'Umidade',
                        umidade: Umidade(
                          dispositivoId: controller.currentAtivo!.dispotividoId,
                          sensorId: controller.currentAtivo!.sensorId,
                          data: controller.currentUmidadeDate,
                          umidade: controller.currentUmidade,
                        ),
                      ),
                    );
                  }
                : () {
                    controller.sendTemperaturaData(context);
                    historicoController.storeHistorico(
                      HistoricoEntity(
                        ativo: controller.currentAtivo!,
                        type: 'Temperatura',
                        temperatura: Temperatura(
                          dispositivoId: controller.currentAtivo!.dispotividoId,
                          sensorId: controller.currentAtivo!.sensorId,
                          data: controller.currentTemperaturaDate,
                          temperatura: controller.currentTemperatura,
                        ),
                      ),
                    );
                  },
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
