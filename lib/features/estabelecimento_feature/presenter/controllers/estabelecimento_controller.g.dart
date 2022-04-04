// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estabelecimento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstabelecimentoController on _EstabelecimentoControllerBase, Store {
  Computed<List<Estabelecimento>>? _$listFilteredComputed;

  @override
  List<Estabelecimento> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Estabelecimento>>(() => super.listFiltered,
              name: '_EstabelecimentoControllerBase.listFiltered'))
      .value;

  final _$estabelecimentosAtom =
      Atom(name: '_EstabelecimentoControllerBase.estabelecimentos');

  @override
  ObservableList<Estabelecimento> get estabelecimentos {
    _$estabelecimentosAtom.reportRead();
    return super.estabelecimentos;
  }

  @override
  set estabelecimentos(ObservableList<Estabelecimento> value) {
    _$estabelecimentosAtom.reportWrite(value, super.estabelecimentos, () {
      super.estabelecimentos = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_EstabelecimentoControllerBase.isLoading');

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

  final _$filterAtom = Atom(name: '_EstabelecimentoControllerBase.filter');

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

  final _$getAllEstabelecimentosAsyncAction =
      AsyncAction('_EstabelecimentoControllerBase.getAllEstabelecimentos');

  @override
  Future getAllEstabelecimentos() {
    return _$getAllEstabelecimentosAsyncAction
        .run(() => super.getAllEstabelecimentos());
  }

  final _$_EstabelecimentoControllerBaseActionController =
      ActionController(name: '_EstabelecimentoControllerBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_EstabelecimentoControllerBaseActionController
        .startAction(name: '_EstabelecimentoControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_EstabelecimentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estabelecimentos: ${estabelecimentos},
isLoading: ${isLoading},
filter: ${filter},
listFiltered: ${listFiltered}
    ''';
  }
}
