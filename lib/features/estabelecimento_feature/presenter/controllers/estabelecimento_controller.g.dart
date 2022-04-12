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
  List<Estabelecimento>? get estabelecimentos {
    _$estabelecimentosAtom.reportRead();
    return super.estabelecimentos;
  }

  @override
  set estabelecimentos(List<Estabelecimento>? value) {
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

  final _$sortedAtom = Atom(name: '_EstabelecimentoControllerBase.sorted');

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

  final _$favoritesOnAtom =
      Atom(name: '_EstabelecimentoControllerBase.favoritesOn');

  @override
  bool get favoritesOn {
    _$favoritesOnAtom.reportRead();
    return super.favoritesOn;
  }

  @override
  set favoritesOn(bool value) {
    _$favoritesOnAtom.reportWrite(value, super.favoritesOn, () {
      super.favoritesOn = value;
    });
  }

  final _$getAllEstabelecimentosAsyncAction =
      AsyncAction('_EstabelecimentoControllerBase.getAllEstabelecimentos');

  @override
  Future getAllEstabelecimentos() {
    return _$getAllEstabelecimentosAsyncAction
        .run(() => super.getAllEstabelecimentos());
  }

  final _$setAFavoriteEstabelecimentoAsyncAction =
      AsyncAction('_EstabelecimentoControllerBase.setAFavoriteEstabelecimento');

  @override
  Future<void> setAFavoriteEstabelecimento(
      Estabelecimento estabelecimento, BuildContext context) {
    return _$setAFavoriteEstabelecimentoAsyncAction
        .run(() => super.setAFavoriteEstabelecimento(estabelecimento, context));
  }

  final _$removeAFavoriteEstabelecimentoAsyncAction = AsyncAction(
      '_EstabelecimentoControllerBase.removeAFavoriteEstabelecimento');

  @override
  Future<void> removeAFavoriteEstabelecimento(
      int companyId, BuildContext context) {
    return _$removeAFavoriteEstabelecimentoAsyncAction
        .run(() => super.removeAFavoriteEstabelecimento(companyId, context));
  }

  final _$getStatusOfFavoriteEstabelecimentoAsyncAction = AsyncAction(
      '_EstabelecimentoControllerBase.getStatusOfFavoriteEstabelecimento');

  @override
  Future<bool?> getStatusOfFavoriteEstabelecimento(int companyId) {
    return _$getStatusOfFavoriteEstabelecimentoAsyncAction
        .run(() => super.getStatusOfFavoriteEstabelecimento(companyId));
  }

  final _$getAllFavoritesEstabelecimentosAsyncAction = AsyncAction(
      '_EstabelecimentoControllerBase.getAllFavoritesEstabelecimentos');

  @override
  Future<void> getAllFavoritesEstabelecimentos() {
    return _$getAllFavoritesEstabelecimentosAsyncAction
        .run(() => super.getAllFavoritesEstabelecimentos());
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
  dynamic sortList() {
    final _$actionInfo = _$_EstabelecimentoControllerBaseActionController
        .startAction(name: '_EstabelecimentoControllerBase.sortList');
    try {
      return super.sortList();
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
sorted: ${sorted},
favoritesOn: ${favoritesOn},
listFiltered: ${listFiltered}
    ''';
  }
}
