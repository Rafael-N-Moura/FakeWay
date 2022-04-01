import 'dart:convert';

import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/http_client/http_client.dart';
import 'package:fake_way/features/fake_way/data/datasources/endpoints/coordinate_endpoint.dart';
import 'package:fake_way/features/fake_way/data/datasources/endpoints/humidity_endpoint.dart';
import 'package:fake_way/features/fake_way/data/datasources/endpoints/property_endpoint.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/datasources/endpoints/temperature_endpoint.dart';
import 'package:fake_way/features/fake_way/data/datasources/i_data_source.dart';
import 'package:fake_way/features/fake_way/data/models/ativo_model.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/coordenata_model.dart';
import 'package:fake_way/features/estabelecimento_feature/data/models/estabelecimento_model.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/umidade_model.dart';

import '../../../enviar_dato_feature.dart/data/models/temperatura_model.dart';

class DataSourceImplementation extends IDataSource {
  final HttpClient client;
  DataSourceImplementation(this.client);

  @override
  Future<List<AtivoModel>> getAllAtivosByEstabelecimento(
      int estabelecimentoId) async {
    final response = await client.get(PropertyEndpoint.api());
    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.data);
      List<AtivoModel> ativoList = list
          .map((e) => AtivoModel.fromJson(e))
          .where((e) => e.estabelecimento.companyId == estabelecimentoId)
          .toList();
      return ativoList;
    } else {
      throw ServerException();
    }
  }

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

  @override
  Future sendCoordenadaData(CoordenadaModel coordenada) async {
    final data = coordenada.toMap();
    final response = await client.put(CoordinateEndpoint.api(), body: data);
    if (response.statusCode == 200) {
    } else {
      return ServerException();
    }
  }

  @override
  Future sendTemperatureData(TemperaturaModel temperatura) async {
    final data = temperatura.toMap();
    final response = await client.put(TemperatureEndpoint.api(), body: data);
    if (response.statusCode == 200) {
    } else {
      return ServerException();
    }
  }

  @override
  Future sendUmidadeData(UmidadeModel umidade) async {
    final data = umidade.toMap();
    final response = await client.put(HumidityEndpoint.api(), body: data);
    if (response.statusCode == 200) {
    } else {
      return ServerException();
    }
  }
}
