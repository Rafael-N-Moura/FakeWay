import 'dart:convert';

import 'package:fake_way/features/estabelecimento_feature/data/datasources/i_estabelecimento_data_source.dart';

import '../../../../core/endpoints/property_endpoint.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/http_client/http_client.dart';
import '../models/estabelecimento_model.dart';

class EstabelecimentoDataSourceImplementation
    extends IEstabelecimentoDataSource {
  final HttpClient client;
  EstabelecimentoDataSourceImplementation(this.client);

  @override
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos() async {
    final response = await client.get(PropertyEndpoint.api());
    if (response.statusCode == 200) {
      Iterable list = response.data;
      List<EstabelecimentoModel> estabelecimentoList =
          list.map((e) => EstabelecimentoModel.fromJson(e)).toSet().toList();
      return estabelecimentoList;
    } else {
      throw ServerException();
    }
  }
}
