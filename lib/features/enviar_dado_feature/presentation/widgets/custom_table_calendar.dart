import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/enviar_dado_controller.dart';

class CustomTableCalendar extends StatelessWidget {
  CustomTableCalendar({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;
  final EnviarDadoController controller = Modular.get<EnviarDadoController>();

  @override
  Widget build(BuildContext context) {
    DateTime focusedDay;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Observer(builder: (_) {
        if (type == 'temperatura') {
          focusedDay = controller.focusedDayTemperatura;
        } else if (type == 'umidade') {
          focusedDay = controller.focusedDayUmidade;
        } else {
          focusedDay = controller.focusedDayCoordenada;
        }
        return TableCalendar(
          onFormatChanged: (format) {},
          locale: 'pt_BR',
          focusedDay: focusedDay,
          firstDay: DateTime.now().add(
            const Duration(days: -365),
          ),
          lastDay: DateTime.now().add(
            const Duration(days: 365),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            controller.setFocusedDay(focusedDay, type);
            controller.setSelectedDay(selectedDay, type);
          },
          selectedDayPredicate: (day) {
            if (type == 'temperatura') {
              return isSameDay(controller.currentTemperaturaDate, day);
            } else if (type == 'umidade') {
              return isSameDay(controller.currentUmidadeDate, day);
            } else {
              return isSameDay(controller.currentCoordenadaDate, day);
            }
          },
          onPageChanged: (focusedDay) {
            controller.setFocusedDay(focusedDay, type);
          },
        );
      }),
    );
  }
}
