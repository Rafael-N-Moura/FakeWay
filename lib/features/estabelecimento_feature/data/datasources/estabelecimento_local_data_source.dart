import '../models/estabelecimento_model.dart';

abstract class IEstabelecimentoLocalDataSource {
  Future<List<EstabelecimentoModel>> getAllFavoritesEstabelecimentos();
  Future setAFavoriteEstabelecimento(EstabelecimentoModel estabelecimentoModel);
  Future removeAFavoriteEstabelecimento(int companyId);
  Future<bool> getStatusOfFavoriteEstabelecimento(int companyId);
}
