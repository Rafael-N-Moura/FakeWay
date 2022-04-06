import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../../../../core/utils/way_colors.dart';
import '../controllers/enviar_dado_controller.dart';
import '../widgets/custom_table_calendar.dart';
import '../widgets/scroll_indicator_widget.dart';
import '../widgets/send_data_button_widget.dart';
import '../widgets/send_data_label_widget.dart';

class DynamicEnviarDadoPage extends StatefulWidget {
  const DynamicEnviarDadoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DynamicEnviarDadoPage> createState() => _DynamicEnviarDadoPageState();
}

class _DynamicEnviarDadoPageState extends State<DynamicEnviarDadoPage> {
  @override
  Widget build(BuildContext context) {
    final EnviarDadoController controller = Modular.get<EnviarDadoController>();
    Completer<GoogleMapController> _controller = Completer();
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(controller.currentLatitude, controller.currentLongitude),
      zoom: 14.4746,
    );
    return Stack(
      children: [
        Observer(builder: (_) {
          return GoogleMap(
            markers: <Marker>{controller.marcador},
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onLongPress: (values) {
              controller.changeLatitudeAndLongitude(
                  values.latitude, values.longitude);
              controller.setMarker(values.latitude, values.longitude);
            },
          );
        }),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                            text: controller.currentLatitude.toStringAsFixed(6),
                          ),
                          decoration:
                              const InputDecoration(hintText: 'Latitude'),
                          onChanged: (text) {
                            if (text.isNotEmpty && text != "-") {
                              controller.currentLatitude = double.parse(text);
                              controller.setMarker(double.parse(text),
                                  controller.getMarker().position.longitude);
                            }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: TextEditingController(
                          text: controller.currentLongitude.toStringAsFixed(6),
                        ),
                        decoration:
                            const InputDecoration(hintText: 'Longitude'),
                        onChanged: (text) {
                          if (text.isNotEmpty && text != "-") {
                            controller.currentLongitude = double.parse(text);
                            controller.setMarker(
                                controller.getMarker().position.latitude,
                                double.parse(text));
                          }
                        },
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
                                controller.currentAtivo!.sensorId.toString(),
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
                              Observer(builder: (_) {
                                return Text(
                                  controller.currentLatitude.toStringAsFixed(6),
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
                                'Data',
                                style: TextStyle(
                                    color: WayColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              Observer(builder: (_) {
                                return Text(
                                  "${controller.currentCoordenadaDate.day}/${controller.currentCoordenadaDate.month}/${controller.currentCoordenadaDate.year}",
                                  style: TextStyle(
                                      fontFamily: 'Sansation',
                                      color: WayColors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                );
                              }),
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
                              Observer(
                                builder: (_) {
                                  return Text(
                                    controller.currentLongitude
                                        .toStringAsFixed(6),
                                    style: TextStyle(
                                        fontFamily: 'Sansation',
                                        color: WayColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SendDataButtonWidget(
                      function: () => controller.sendCoordenadaData(context),
                    ),
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
