import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/historico_feature/domain/entities/historico_entity.dart';
import 'package:fake_way/features/historico_feature/presentation/widgets/coordenada_information_widget.dart';
import 'package:fake_way/features/historico_feature/presentation/widgets/umidade_or_temperatura_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../enviar_dado_feature/presentation/controllers/enviar_dado_controller.dart';
import '../controllers/historico_controller.dart';

class HistoricoCardWidget extends StatelessWidget {
  final HistoricoEntity historico;
  HistoricoCardWidget({Key? key, required this.historico}) : super(key: key);

  final HistoricoController controller = Modular.get<HistoricoController>();
  final EnviarDadoController enviarDadoController =
      Modular.get<EnviarDadoController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      historico.ativo.estabelecimento.companyName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Raleway",
                        color: WayColors.primaryColor,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: WayColors.primaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: WayColors.primaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${historico.ativo.nome!} - ${historico.type}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Raleway",
                  color: WayColors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              historico.type == 'Coordenada'
                  ? CoordenadaInformationWidget(historico: historico)
                  : UmidadeOrTemperaturaInformationWidget(historico: historico),
            ],
          ),
        ),
      ),
      onTap: () async {
        Modular.to
            .pushNamed('/enviar-dado-module/', arguments: historico.ativo);
        await Future.delayed(const Duration(milliseconds: 100));
        if (historico.type == 'Temperatura') {
          enviarDadoController
              .changeTemperaturaDate(historico.temperatura!.data);
          enviarDadoController
              .setCurrentTemperatura(historico.temperatura!.temperatura);
        } else if (historico.type == 'Umidade') {
          enviarDadoController.changeUmidadeDate(historico.umidade!.data);
          enviarDadoController.setCurrentUmidade(historico.umidade!.umidade);
        } else {
          enviarDadoController.changeCoordenadaDate(historico.coordenada!.data);
          enviarDadoController.changeLatitudeAndLongitude(
              historico.coordenada!.latitude, historico.coordenada!.longitude);
        }
      },
    );
  }
}
