// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricoController on _HistoricoControllerBase, Store {
  Computed<List<HistoricoEntity>>? _$listFilteredComputed;

  @override
  List<HistoricoEntity> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<HistoricoEntity>>(() => super.listFiltered,
              name: '_HistoricoControllerBase.listFiltered'))
      .value;

  final _$isLoadingAtom = Atom(name: '_HistoricoControllerBase.isLoading');

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

  final _$historicoAtom = Atom(name: '_HistoricoControllerBase.historico');

  @override
  List<HistoricoEntity>? get historico {
    _$historicoAtom.reportRead();
    return super.historico;
  }

  @override
  set historico(List<HistoricoEntity>? value) {
    _$historicoAtom.reportWrite(value, super.historico, () {
      super.historico = value;
    });
  }

  final _$filterAtom = Atom(name: '_HistoricoControllerBase.filter');

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

  final _$getTotalHistoricoAsyncAction =
      AsyncAction('_HistoricoControllerBase.getTotalHistorico');

  @override
  Future<void> getTotalHistorico() {
    return _$getTotalHistoricoAsyncAction.run(() => super.getTotalHistorico());
  }

  final _$storeHistoricoAsyncAction =
      AsyncAction('_HistoricoControllerBase.storeHistorico');

  @override
  Future<void> storeHistorico(HistoricoEntity historico) {
    return _$storeHistoricoAsyncAction
        .run(() => super.storeHistorico(historico));
  }

  final _$_HistoricoControllerBaseActionController =
      ActionController(name: '_HistoricoControllerBase');

  @override
  void setFilter(String value) {
    final _$actionInfo = _$_HistoricoControllerBaseActionController.startAction(
        name: '_HistoricoControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_HistoricoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
historico: ${historico},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
