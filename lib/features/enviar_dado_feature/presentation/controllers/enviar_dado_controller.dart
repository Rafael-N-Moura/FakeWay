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

  _EnviarDadoControllerBase({
    required this.sendTemperatureUsecase,
    required this.sendUmidadeUsecase,
  });

  @observable
  Ativo? currentAtivo;

  @action
  setCurrentAtivo(Ativo value) {
    currentAtivo = value;
  }

  @observable
  double currentTemperatura = 0;

  @observable
  double currentUmidade = 0;

  @observable
  DateTime currentTemperaturaDate = DateTime.now();

  @observable
  DateTime currentUmidadeDate = DateTime.now();

  @observable
  late Coordenada currentCoordenada;

  @action
  increaseTemperatura(double value) {
    currentTemperatura += value;
  }

  @action
  increaseUmidade(double value) {
    currentUmidade += value;
  }

  @action
  changeTemperaturaDate(DateTime value) {
    currentTemperaturaDate = value;
  }

  @action
  changeUmidadeDate(DateTime value) {
    currentUmidadeDate = value;
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
  setFocusedDay(DateTime value, String type) {
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
    }
    if (type == 'umidade') {
      changeUmidadeDate(value);
    }
  }
}
