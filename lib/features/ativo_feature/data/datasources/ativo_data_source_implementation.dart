import 'package:fake_way/core/endpoints/property_endpoint.dart';
import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/http_client/http_client.dart';
import 'package:fake_way/features/ativo_feature/data/datasources/i_ativo_data_source.dart';
import 'package:fake_way/features/ativo_feature/data/models/ativo_model.dart';

class AtivoDataSourceImplementation extends IAtivoDataSource {
  final HttpClient client;
  AtivoDataSourceImplementation(this.client);

  @override
  Future<List<AtivoModel>> getAllAtivosByEstabelecimento(
      int estabelecimentoId) async {
    final response = await client.get(PropertyEndpoint.api());
    if (response.statusCode == 200) {
      Iterable list = response.data;
      List<AtivoModel> ativoList = list
          .map((e) => AtivoModel.fromJson(e))
          .where((e) => e.estabelecimento.companyId == estabelecimentoId)
          .toList();
      return ativoList;
    } else {
      throw ServerException();
    }
  }
}
