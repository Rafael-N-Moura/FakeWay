import 'package:flutter/material.dart';

import '../../../../core/utils/way_colors.dart';
import '../../domain/entities/historico_entity.dart';

class CoordenadaInformationWidget extends StatelessWidget {
  const CoordenadaInformationWidget({
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
                  fontSize: 14),
            ),
            Text(
              historico.ativo.sensorId.toString(),
              style: TextStyle(
                  fontFamily: 'Sansation',
                  color: WayColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Latitude',
              style: TextStyle(
                  color: WayColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            Text(
              historico.coordenada!.latitude.toStringAsFixed(6),
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Data',
              style: TextStyle(
                  color: WayColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            Text(
              "${historico.coordenada!.data.day}/${historico.coordenada!.data.month}/${historico.coordenada!.data.year}",
              style: TextStyle(
                fontFamily: 'Sansation',
                color: WayColors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Longitude',
              style: TextStyle(
                  color: WayColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            Text(
              historico.coordenada!.longitude.toStringAsFixed(6),
              style: TextStyle(
                  fontFamily: 'Sansation',
                  color: WayColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
