import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/way_colors.dart';
import '../../../ativo_feature/domain/entities/ativo_entity.dart';
import '../controllers/enviar_dado_controller.dart';
import '../widgets/scroll_indicator_widget.dart';
import '../widgets/send_data_button_widget.dart';
import '../widgets/send_data_label_widget.dart';
import '../widgets/value_picker_widget.dart';

class EnviarDadoPage extends StatefulWidget {
  final Ativo ativo;
  const EnviarDadoPage({Key? key, required this.ativo}) : super(key: key);

  @override
  State<EnviarDadoPage> createState() => _EnviarDadoPageState();
}

class _EnviarDadoPageState extends State<EnviarDadoPage> {
  final EnviarDadoController controller = Modular.get<EnviarDadoController>();

  @override
  void initState() {
    controller.setCurrentAtivo(widget.ativo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          leading: InkWell(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () {
              Modular.to.pop();
            },
          ),
          title: Text(
            widget.ativo.nome ?? "Ativo sem nome",
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
          ),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
              indicatorWeight: 8,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    'Temperatura',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Umidade',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Coordenada',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                )
              ]),
        ),
        body: TabBarView(
          children: [
            StaticEnviarDadoPage(
              type: false,
            ),
            StaticEnviarDadoPage(
              type: true,
            ),
            DynamicEnviarDadoPage(),
          ],
        ),
      ),
    );
  }
}

class DynamicEnviarDadoPage extends StatelessWidget {
  const DynamicEnviarDadoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(-8.0458197, -34.9464914),
      zoom: 14.4746,
    );
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: 0.4,
          builder: ((context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Material(
                elevation: 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: ScrollIndicatorWidget(),
                    ),
                    CustomTableCalendar(
                      type: 'coordenada',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Latitude'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Longitude'),
                      ),
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
                                    fontSize: 14),
                              ),
                              Text(
                                '7',
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
                                '-16.750296',
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
                                'Data',
                                style: TextStyle(
                                    color: WayColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              Text(
                                '17/05/2021',
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
                                'Longitude',
                                style: TextStyle(
                                    color: WayColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              Text(
                                '-49.3423414',
                                style: TextStyle(
                                    fontFamily: 'Sansation',
                                    color: WayColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SendDataButtonWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class CustomTableCalendar extends StatelessWidget {
  CustomTableCalendar({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;
  final EnviarDadoController controller = Modular.get<EnviarDadoController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Observer(builder: (_) {
        return TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.now().add(
            const Duration(days: -365),
          ),
          lastDay: DateTime.now().add(
            const Duration(days: 365),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            //controller.setFocusedDay(focusedDay, widget.type);
            controller.setSelectedDay(selectedDay, widget.type);
          },
        );
      }),
    );
  }
}

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
                          fontSize: 14),
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
          const SendDataButtonWidget(),
        ],
      ),
    );
  }
}
