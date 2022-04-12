import 'package:fake_way/features/enviar_dado_feature/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/umidade_entity.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_coordenada_data_usecase.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/coordenada_entity.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_temperature_data_usecase.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/usecases/send_umidade_data_usecase.dart';

import '../../../ativo_feature/domain/entities/ativo_entity.dart';

part 'enviar_dado_controller.g.dart';

class EnviarDadoController = _EnviarDadoControllerBase
    with _$EnviarDadoController;

abstract class _EnviarDadoControllerBase with Store {
  final SendTemperatureData sendTemperatureUsecase;
  final SendUmidadeDataUsecase sendUmidadeUsecase;
  final SendCoordenadaData sendCoordenadaUsecase;

  _EnviarDadoControllerBase({
    required this.sendTemperatureUsecase,
    required this.sendUmidadeUsecase,
    required this.sendCoordenadaUsecase,
  });

  @observable
  Ativo? currentAtivo;

  @action
  setCurrentAtivo(Ativo value) {
    currentAtivo = value;
  }

  //Coordenada

  @observable
  double currentLatitude = 0;

  @observable
  double currentLongitude = 0;

  @observable
  Marker marcador = const Marker(markerId: MarkerId("Meu Ponto"));

  @observable
  DateTime currentCoordenadaDate = DateTime.now();

  @action
  changeLatitudeAndLongitude(double latitude, double longitude) {
    currentLatitude = latitude;
    currentLongitude = longitude;
  }

  @action
  Marker getMarker() {
    return marcador;
  }

  @action
  setMarker(double lat, double long) {
    marcador = Marker(markerId: marcador.mapsId, position: LatLng(lat, long));
  }

  @action
  changeCoordenadaDate(DateTime value) {
    currentCoordenadaDate = value;
  }

  @action
  setInitialCoordenada(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "O GPS está desativado",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Permissão para ter acesso à localização não concedida",
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Permissão negada para sempre",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (serviceEnabled && permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      await Geolocator.getCurrentPosition().then((value) =>
          changeLatitudeAndLongitude(value.latitude, value.longitude));
    }
  }

  @action
  sendCoordenadaData(BuildContext context) async {
    final result = await sendCoordenadaUsecase(Coordenada(
        dispositivoId: currentAtivo!.dispotividoId,
        sensorId: currentAtivo!.sensorId,
        data: currentCoordenadaDate,
        latitude: currentLatitude,
        longitude: currentLongitude,
        velocidade: 0));
    result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              "Não foi possível enviar os dados",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      (r) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Dados de Coordenada enviados com sucesso",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // Temperatura

  @observable
  double currentTemperatura = 0;

  @observable
  DateTime currentTemperaturaDate = DateTime.now();

  @action
  Future<void> setCurrentTemperatura(double value) async {
    currentTemperatura = value;
  }

  @action
  increaseTemperatura(double value) {
    currentTemperatura += value;
  }

  @action
  changeTemperaturaDate(DateTime value) {
    currentTemperaturaDate = value;
  }

  @action
  sendTemperaturaData(BuildContext context) async {
    final result = await sendTemperatureUsecase(
      Temperatura(
        dispositivoId: currentAtivo!.dispotividoId,
        sensorId: currentAtivo!.sensorId,
        data: currentTemperaturaDate,
        temperatura: currentTemperatura,
      ),
    );
    result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              "Não foi possível enviar os dados",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      (r) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Dados de Temperatura enviados com sucesso",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  //Umidade

  @observable
  double currentUmidade = 0;

  @observable
  DateTime currentUmidadeDate = DateTime.now();

  @action
  Future<void> setCurrentUmidade(double value) async {
    currentUmidade = value;
  }

  @action
  increaseUmidade(double value) {
    if ((currentUmidade == 0 && value < 0) ||
        (currentUmidade == 0.5 && value == -1)) {
      currentUmidade = 0;
    } else {
      currentUmidade += value;
    }
  }

  @action
  sendUmidadeaData(BuildContext context) async {
    final result = await sendUmidadeUsecase(
      Umidade(
        dispositivoId: currentAtivo!.dispotividoId,
        sensorId: currentAtivo!.sensorId,
        data: currentUmidadeDate,
        umidade: currentUmidade,
      ),
    );
    result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              "Não foi possível enviar os dados",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      (r) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Dados de Umidade enviados com sucesso",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @action
  changeUmidadeDate(DateTime value) {
    currentUmidadeDate = value;
  }

  @action
  getFocusedDay(String type) {
    switch (type) {
      case 'temperatura':
        return focusedDayTemperatura;
      case 'umidade':
        return focusedDayUmidade;
      case 'coordenada':
        return focusedDayCoordenada;
      default:
        break;
    }
  }

  //Table Calendar
  @observable
  DateTime focusedDayTemperatura = DateTime.now();

  @observable
  DateTime focusedDayUmidade = DateTime.now();

  @observable
  DateTime focusedDayCoordenada = DateTime.now();

  @observable
  DateTime selectedDay = DateTime.now();

  @action
  void setFocusedDay(DateTime value, String type) {
    if (type == 'temperatura') {
      focusedDayTemperatura = value;
    }
    if (type == 'umidade') {
      focusedDayUmidade = value;
    }
    if (type == 'coordenada') {
      focusedDayCoordenada = value;
    }
  }

  @action
  setSelectedDay(DateTime value, String type) {
    if (type == 'temperatura') {
      changeTemperaturaDate(value);
    } else if (type == 'umidade') {
      changeUmidadeDate(value);
    } else if (type == 'coordenada') {
      changeCoordenadaDate(value);
    }
  }

  @action
  clearControllerValues() {
    currentTemperatura = 0;
    currentUmidade = 0;
    currentTemperaturaDate = DateTime.now();
    currentUmidadeDate = DateTime.now();
    currentCoordenadaDate = DateTime.now();
  }
}
