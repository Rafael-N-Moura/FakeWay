// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ativo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtivoController on _AtivoControllerBase, Store {
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

  final _$getAllAtivosAsyncAction =
      AsyncAction('_AtivoControllerBase.getAllAtivos');

  @override
  Future getAllAtivos(int idEstabelecimento) {
    return _$getAllAtivosAsyncAction
        .run(() => super.getAllAtivos(idEstabelecimento));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
ativos: ${ativos}
    ''';
  }
}