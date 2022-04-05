// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enviar_dado_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnviarDadoController on _EnviarDadoControllerBase, Store {
  final _$currentAtivoAtom =
      Atom(name: '_EnviarDadoControllerBase.currentAtivo');

  @override
  Ativo? get currentAtivo {
    _$currentAtivoAtom.reportRead();
    return super.currentAtivo;
  }

  @override
  set currentAtivo(Ativo? value) {
    _$currentAtivoAtom.reportWrite(value, super.currentAtivo, () {
      super.currentAtivo = value;
    });
  }

  final _$currentTemperaturaAtom =
      Atom(name: '_EnviarDadoControllerBase.currentTemperatura');

  @override
  double get currentTemperatura {
    _$currentTemperaturaAtom.reportRead();
    return super.currentTemperatura;
  }

  @override
  set currentTemperatura(double value) {
    _$currentTemperaturaAtom.reportWrite(value, super.currentTemperatura, () {
      super.currentTemperatura = value;
    });
  }

  final _$currentUmidadeAtom =
      Atom(name: '_EnviarDadoControllerBase.currentUmidade');

  @override
  double get currentUmidade {
    _$currentUmidadeAtom.reportRead();
    return super.currentUmidade;
  }

  @override
  set currentUmidade(double value) {
    _$currentUmidadeAtom.reportWrite(value, super.currentUmidade, () {
      super.currentUmidade = value;
    });
  }

  final _$currentTemperaturaDateAtom =
      Atom(name: '_EnviarDadoControllerBase.currentTemperaturaDate');

  @override
  DateTime get currentTemperaturaDate {
    _$currentTemperaturaDateAtom.reportRead();
    return super.currentTemperaturaDate;
  }

  @override
  set currentTemperaturaDate(DateTime value) {
    _$currentTemperaturaDateAtom
        .reportWrite(value, super.currentTemperaturaDate, () {
      super.currentTemperaturaDate = value;
    });
  }

  final _$currentUmidadeDateAtom =
      Atom(name: '_EnviarDadoControllerBase.currentUmidadeDate');

  @override
  DateTime get currentUmidadeDate {
    _$currentUmidadeDateAtom.reportRead();
    return super.currentUmidadeDate;
  }

  @override
  set currentUmidadeDate(DateTime value) {
    _$currentUmidadeDateAtom.reportWrite(value, super.currentUmidadeDate, () {
      super.currentUmidadeDate = value;
    });
  }

  final _$currentCoordenadaDateAtom =
      Atom(name: '_EnviarDadoControllerBase.currentCoordenadaDate');

  @override
  DateTime get currentCoordenadaDate {
    _$currentCoordenadaDateAtom.reportRead();
    return super.currentCoordenadaDate;
  }

  @override
  set currentCoordenadaDate(DateTime value) {
    _$currentCoordenadaDateAtom.reportWrite(value, super.currentCoordenadaDate,
        () {
      super.currentCoordenadaDate = value;
    });
  }

  final _$currentCoordenadaAtom =
      Atom(name: '_EnviarDadoControllerBase.currentCoordenada');

  @override
  Coordenada get currentCoordenada {
    _$currentCoordenadaAtom.reportRead();
    return super.currentCoordenada;
  }

  @override
  set currentCoordenada(Coordenada value) {
    _$currentCoordenadaAtom.reportWrite(value, super.currentCoordenada, () {
      super.currentCoordenada = value;
    });
  }

  final _$focusedDayTemperaturaAtom =
      Atom(name: '_EnviarDadoControllerBase.focusedDayTemperatura');

  @override
  DateTime get focusedDayTemperatura {
    _$focusedDayTemperaturaAtom.reportRead();
    return super.focusedDayTemperatura;
  }

  @override
  set focusedDayTemperatura(DateTime value) {
    _$focusedDayTemperaturaAtom.reportWrite(value, super.focusedDayTemperatura,
        () {
      super.focusedDayTemperatura = value;
    });
  }

  final _$focusedDayUmidadeAtom =
      Atom(name: '_EnviarDadoControllerBase.focusedDayUmidade');

  @override
  DateTime get focusedDayUmidade {
    _$focusedDayUmidadeAtom.reportRead();
    return super.focusedDayUmidade;
  }

  @override
  set focusedDayUmidade(DateTime value) {
    _$focusedDayUmidadeAtom.reportWrite(value, super.focusedDayUmidade, () {
      super.focusedDayUmidade = value;
    });
  }

  final _$focusedDayCoordenadaAtom =
      Atom(name: '_EnviarDadoControllerBase.focusedDayCoordenada');

  @override
  DateTime get focusedDayCoordenada {
    _$focusedDayCoordenadaAtom.reportRead();
    return super.focusedDayCoordenada;
  }

  @override
  set focusedDayCoordenada(DateTime value) {
    _$focusedDayCoordenadaAtom.reportWrite(value, super.focusedDayCoordenada,
        () {
      super.focusedDayCoordenada = value;
    });
  }

  final _$selectedDayAtom = Atom(name: '_EnviarDadoControllerBase.selectedDay');

  @override
  DateTime get selectedDay {
    _$selectedDayAtom.reportRead();
    return super.selectedDay;
  }

  @override
  set selectedDay(DateTime value) {
    _$selectedDayAtom.reportWrite(value, super.selectedDay, () {
      super.selectedDay = value;
    });
  }

  final _$_EnviarDadoControllerBaseActionController =
      ActionController(name: '_EnviarDadoControllerBase');

  @override
  dynamic setCurrentAtivo(Ativo value) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.setCurrentAtivo');
    try {
      return super.setCurrentAtivo(value);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic increaseTemperatura(double value) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.increaseTemperatura');
    try {
      return super.increaseTemperatura(value);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic increaseUmidade(double value) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.increaseUmidade');
    try {
      return super.increaseUmidade(value);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTemperaturaDate(DateTime value) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.changeTemperaturaDate');
    try {
      return super.changeTemperaturaDate(value);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUmidadeDate(DateTime value) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.changeUmidadeDate');
    try {
      return super.changeUmidadeDate(value);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCoordenadaDate(DateTime value) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.changeCoordenadaDate');
    try {
      return super.changeCoordenadaDate(value);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getFocusedDay(String type) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.getFocusedDay');
    try {
      return super.getFocusedDay(type);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFocusedDay(DateTime value, String type) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.setFocusedDay');
    try {
      return super.setFocusedDay(value, type);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedDay(DateTime value, String type) {
    final _$actionInfo = _$_EnviarDadoControllerBaseActionController
        .startAction(name: '_EnviarDadoControllerBase.setSelectedDay');
    try {
      return super.setSelectedDay(value, type);
    } finally {
      _$_EnviarDadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentAtivo: ${currentAtivo},
currentTemperatura: ${currentTemperatura},
currentUmidade: ${currentUmidade},
currentTemperaturaDate: ${currentTemperaturaDate},
currentUmidadeDate: ${currentUmidadeDate},
currentCoordenadaDate: ${currentCoordenadaDate},
currentCoordenada: ${currentCoordenada},
focusedDayTemperatura: ${focusedDayTemperatura},
focusedDayUmidade: ${focusedDayUmidade},
focusedDayCoordenada: ${focusedDayCoordenada},
selectedDay: ${selectedDay}
    ''';
  }
}
