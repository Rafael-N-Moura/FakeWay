import 'dart:convert';

import 'package:fake_way/features/estabelecimento_feature/data/datasources/i_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/http_client/http_client.dart';
import '../models/estabelecimento_model.dart';

class DataSourceImplementation extends IDataSource {
  final HttpClient client;
  DataSourceImplementation(this.client);

  @override
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos() async {
    final response = await client.get(PropertyEndpoint.api());
    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.data);
      List<EstabelecimentoModel> estabelecimentoList =
          list.map((e) => EstabelecimentoModel.fromJson(e)).toSet().toList();
      return estabelecimentoList;
    } else {
      throw ServerException();
    }
  }
}
