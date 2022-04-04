import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/features/enviar_dado_feature/data/datasources/data_source.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/coordenata_model.dart';
import '../../../../core/http_client/http_client.dart';
import '../models/temperatura_model.dart';
import '../models/umidade_model.dart';
import 'endpoints/coordinate_endpoint.dart';
import 'endpoints/humidity_endpoint.dart';
import 'endpoints/temperature_endpoint.dart';

class DataSourceImplementation implements IDataSource {
  final HttpClient client;
  DataSourceImplementation(this.client);
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