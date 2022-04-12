import 'package:flutter/material.dart';

import '../../../../core/utils/way_colors.dart';
import '../../domain/entities/historico_entity.dart';

class UmidadeOrTemperaturaInformationWidget extends StatelessWidget {
  const UmidadeOrTemperaturaInformationWidget({
    Key? key,
    required this.historico,
  }) : super(key: key);

  final HistoricoEntity historico;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              historico.ativo.sensorId.toString(),
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
            Text(
              historico.type == 'Umidade'
                  ? '${historico.umidade!.data.day.toString()}/${historico.umidade!.data.month.toString()}/${historico.umidade!.data.year.toString()}'
                  : '${historico.temperatura!.data.day.toString()}/${historico.temperatura!.data.month.toString()}/${historico.temperatura!.data.year.toString()}',
              style: TextStyle(
                  fontFamily: 'Sansation',
                  color: WayColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              historico.type,
              style: TextStyle(
                  color: WayColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            Text(
              historico.type == 'Umidade'
                  ? historico.umidade!.umidade.toStringAsFixed(2)
                  : historico.temperatura!.temperatura.toStringAsFixed(2),
              style: TextStyle(
                fontFamily: 'Sansation',
                color: WayColors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
