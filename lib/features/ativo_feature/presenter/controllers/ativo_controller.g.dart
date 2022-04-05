// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ativo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtivoController on _AtivoControllerBase, Store {
  Computed<List<Ativo>>? _$listFilteredComputed;

  @override
  List<Ativo> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Ativo>>(() => super.listFiltered,
              name: '_AtivoControllerBase.listFiltered'))
      .value;

  final _$isLoadingAtom = Atom(name: '_AtivoControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$ativosAtom = Atom(name: '_AtivoControllerBase.ativos');

  @override
  ObservableList<Ativo> get ativos {
    _$ativosAtom.reportRead();
    return super.ativos;
  }

  @override
  set ativos(ObservableList<Ativo> value) {
    _$ativosAtom.reportWrite(value, super.ativos, () {
      super.ativos = value;
    });
  }

  final _$filterAtom = Atom(name: '_AtivoControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$sortedAtom = Atom(name: '_AtivoControllerBase.sorted');

  @override
  bool get sorted {
    _$sortedAtom.reportRead();
    return super.sorted;
  }

  @override
  set sorted(bool value) {
    _$sortedAtom.reportWrite(value, super.sorted, () {
      super.sorted = value;
    });
  }

  final _$getAllAtivosAsyncAction =
      AsyncAction('_AtivoControllerBase.getAllAtivos');

  @override
  Future getAllAtivos(int idEstabelecimento) {
    return _$getAllAtivosAsyncAction
        .run(() => super.getAllAtivos(idEstabelecimento));
  }

  final _$_AtivoControllerBaseActionController =
      ActionController(name: '_AtivoControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_AtivoControllerBaseActionController.startAction(
        name: '_AtivoControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_AtivoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sortList() {
    final _$actionInfo = _$_AtivoControllerBaseActionController.startAction(
        name: '_AtivoControllerBase.sortList');
    try {
      return super.sortList();
    } finally {
      _$_AtivoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
ativos: ${ativos},
filter: ${filter},
sorted: ${sorted},
listFiltered: ${listFiltered}
    ''';
  }
}
