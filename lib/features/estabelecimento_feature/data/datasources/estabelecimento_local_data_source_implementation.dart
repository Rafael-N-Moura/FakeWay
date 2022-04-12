import 'package:fake_way/core/usecases/usecase.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/estabelecimento_local_data_source.dart';
import 'package:fake_way/features/estabelecimento_feature/data/models/estabelecimento_model.dart';
import 'package:hive/hive.dart';

import '../../../../core/errors/exceptions.dart';

class EstabelecimentoLocalDatasourceImplementation
    implements IEstabelecimentoLocalDataSource {
  @override
  Future<List<EstabelecimentoModel>> getAllFavoritesEstabelecimentos() async {
    try {
      List<EstabelecimentoModel> list = [];
      final favoriteEstabelecimentosBox =
          await Hive.openBox('favorite_estabelecimentos_box');
      if (favoriteEstabelecimentosBox.isNotEmpty) {
        for (var key in favoriteEstabelecimentosBox.keys) {
          list.add(await favoriteEstabelecimentosBox.get(key));
        }
      }
      return Future.value(list);
    } catch (e) {
      throw LocalDatabaseException();
    }
  }

  @override
  Future setAFavoriteEstabelecimento(
      EstabelecimentoModel estabelecimentoModel) async {
    try {
      final favoriteEstabelecimentosBox =
          await Hive.openBox('favorite_estabelecimentos_box');
      await favoriteEstabelecimentosBox.put(
          estabelecimentoModel.companyId, estabelecimentoModel);
      return Future.value(NoParams());
    } catch (e) {
      throw LocalDatabaseException();
    }
  }

  @override
  Future removeAFavoriteEstabelecimento(int companyId) async {
    try {
      final favoriteEstabelecimentosBox =
          await Hive.openBox('favorite_estabelecimentos_box');
      await favoriteEstabelecimentosBox.delete(companyId);
      return Future.value(NoParams());
    } catch (e) {
      throw LocalDatabaseException();
    }
  }

  @override
  Future<bool> getStatusOfFavoriteEstabelecimento(int companyId) async {
    try {
      final favoriteEstabelecimentosBox =
          await Hive.openBox('favorite_estabelecimentos_box');

      return favoriteEstabelecimentosBox.containsKey(companyId);
    } catch (e) {
      throw LocalDatabaseException();
    }
  }
}
