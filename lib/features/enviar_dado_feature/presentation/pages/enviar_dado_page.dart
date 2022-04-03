import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/way_colors.dart';
import '../../../ativo_feature/domain/entities/ativo_entity.dart';
import '../widgets/scroll_indicator_widget.dart';
import '../widgets/send_data_button_widget.dart';
import '../widgets/send_data_label_widget.dart';
import '../widgets/value_picker_widget.dart';

class EnviarDadoPage extends StatelessWidget {
  final Ativo ativo;
  const EnviarDadoPage({Key? key, required this.ativo}) : super(key: key);

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
            ativo.nome ?? "Ativo sem nome",
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
        body: const TabBarView(
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
                    const CustomTableCalendar(),
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
  const CustomTableCalendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(2020, 10, 10),
        lastDay: DateTime(2022, 10, 10),
      ),
    );
  }
}

class StaticEnviarDadoPage extends StatelessWidget {
  const StaticEnviarDadoPage({
    Key? key,
    required this.type,
  }) : super(key: key);

  // false -> Temperatura
  // true -> Umidade
  final bool type;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomTableCalendar(),
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
                    Text(
                      '10/20/2020',
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
                      type ? 'Umidade' : 'Temperatura',
                      style: TextStyle(
                          color: WayColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                    Text(
                      '+1.5 C',
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
            height: 50,
          ),
          const SendDataButtonWidget(),
        ],
      ),
    );
  }
}
