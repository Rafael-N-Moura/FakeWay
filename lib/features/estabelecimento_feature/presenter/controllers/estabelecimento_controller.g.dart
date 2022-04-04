// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estabelecimento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstabelecimentoController on _EstabelecimentoControllerBase, Store {
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

  final _$getAllEstabelecimentosAsyncAction =
      AsyncAction('_EstabelecimentoControllerBase.getAllEstabelecimentos');

  @override
  Future getAllEstabelecimentos() {
    return _$getAllEstabelecimentosAsyncAction
        .run(() => super.getAllEstabelecimentos());
  }

  @override
  String toString() {
    return '''
estabelecimentos: ${estabelecimentos},
isLoading: ${isLoading}
    ''';
  }
}
