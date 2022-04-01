import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/http_client/http_client.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/datasources/data_source_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/coordenada_entity_mock.dart';
import '../../../../mocks/temperatura_entity_mock.dart';
import '../../../../mocks/umidade_entity_mock.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late DataSourceImplementation dataSource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    dataSource = DataSourceImplementation(client);
  });

  const putCoordenadaUrlExpected =
      "https://wayds.net:8081/fakeway/api/v1/Coordinate";
  const putTemperatureUrlExpected =
      "https://wayds.net:8081/fakeway/api/v1/Temperature";
  const putUmidadeUrlExpected =
      "https://wayds.net:8081/fakeway/api/v1/Humidity";

  test("should call the Send Coordenada Method with correct url ", () async {
    // Arrange
    when(() => client.put(any(), body: tCoordenadaModel.toMap())).thenAnswer(
      (_) async => HttpAnswer(data: tCoordenadaModel.toMap(), statusCode: 200),
    );

    // Act
    await dataSource.sendCoordenadaData(tCoordenadaModel);

    // Assert
    verify(() => client.put(putCoordenadaUrlExpected,
        body: tCoordenadaModel.toMap())).called(1);
  });

  test("should throw a Server Exception when call the Send Coordenada Method",
      () async {
    // Arrange
    when(() => client.put(any(), body: tCoordenadaModel.toMap())).thenAnswer(
      (_) async => HttpAnswer(data: "Something is wrong..", statusCode: 400),
    );

    // Act
    var result = await dataSource.sendCoordenadaData(tCoordenadaModel);

    // Assert
    expect(result, ServerException());

    verify(() => client.put(putCoordenadaUrlExpected,
        body: tCoordenadaModel.toMap())).called(1);
  });

  test("should call the Send Temperatura Method with correct url ", () async {
    // Arrange
    when(() => client.put(any(), body: tTemperatureModel.toMap())).thenAnswer(
      (_) async => HttpAnswer(data: tTemperatureModel.toMap(), statusCode: 200),
    );

    // Act
    await dataSource.sendTemperatureData(tTemperatureModel);

    // Assert
    verify(() => client.put(putTemperatureUrlExpected,
        body: tTemperatureModel.toMap())).called(1);
  });

  test("should throw a Server Exception when call the Send Temperature Method",
      () async {
    // Arrange
    when(() => client.put(any(), body: tTemperatureModel.toMap())).thenAnswer(
      (_) async => HttpAnswer(data: "Something is wrong..", statusCode: 400),
    );

    // Act
    var result = await dataSource.sendTemperatureData(tTemperatureModel);

    // Assert
    expect(result, ServerException());

    verify(() => client.put(putTemperatureUrlExpected,
        body: tTemperatureModel.toMap())).called(1);
  });

  test("should call the Send Umidade Method with correct url ", () async {
    // Arrange
    when(() => client.put(any(), body: tUmidadeModel.toMap())).thenAnswer(
      (_) async => HttpAnswer(data: tUmidadeModel.toMap(), statusCode: 200),
    );

    // Act
    await dataSource.sendUmidadeData(tUmidadeModel);

    // Assert
    verify(() => client.put(putUmidadeUrlExpected, body: tUmidadeModel.toMap()))
        .called(1);
  });

  test("should throw a Server Exception when call the Send Umidade Method",
      () async {
    // Arrange
    when(() => client.put(any(), body: tUmidadeModel.toMap())).thenAnswer(
      (_) async => HttpAnswer(data: "Something is wrong..", statusCode: 400),
    );

    // Act
    var result = await dataSource.sendUmidadeData(tUmidadeModel);

    // Assert
    expect(result, ServerException());

    verify(() => client.put(putUmidadeUrlExpected, body: tUmidadeModel.toMap()))
        .called(1);
  });
}
