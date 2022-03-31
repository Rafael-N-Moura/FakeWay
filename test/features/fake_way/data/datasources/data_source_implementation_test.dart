import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/http_client/http_client.dart';
import 'package:fake_way/features/fake_way/data/datasources/data_source_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/coordenada_entity_mock.dart';
import '../../../../mocks/json_mock.dart';
import '../../../../mocks/lista_de_ativos_dois.dart';
import '../../../../mocks/lista_de_estabelecimentos_mock.dart';
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

  const getUrlExpected = "https://wayds.net:8081/fakeway/api/v1/Property";
  const putCoordenadaUrlExpected =
      "https://wayds.net:8081/fakeway/api/v1/Coordinate";
  const putTemperatureUrlExpected =
      "https://wayds.net:8081/fakeway/api/v1/Temperature";
  const putUmidadeUrlExpected =
      "https://wayds.net:8081/fakeway/api/v1/Humidity";

  sucessMock() {
    when(() => client.get(any())).thenAnswer(
      (_) async => HttpAnswer(data: jsonMock, statusCode: 200),
    );
  }

  failureMock() {
    when(() => client.get(any())).thenAnswer(
        (invocation) async => HttpAnswer(data: 'data', statusCode: 800));
  }

  test('should call the get method with correct url', () async {
    sucessMock();

    await dataSource.getAllEstabelecimentos();

    verify((() => client.get(getUrlExpected))).called(1);
  });

  test('should return a List of Estabelecimentos when is sucessful', () async {
    sucessMock();

    final result = await dataSource.getAllEstabelecimentos();

    expect(result, tListEstabelecimento);
  });

  test(
      'should throw a ServerException when the call to get all the estabelecimentos is unsucessful',
      () {
    failureMock();

    final result = dataSource.getAllEstabelecimentos();

    expect(() => result, throwsA(ServerException()));
  });

  test('should return a List of Ativos when is sucessful', () async {
    sucessMock();

    final result = await dataSource.getAllAtivosByEstabelecimento(1);

    expect(result, tAtivosList2);
  });

  test(
      'should throw a ServerException when the call to get all ativos by estabelecimento is unsucessful',
      () {
    failureMock();

    final result = dataSource.getAllAtivosByEstabelecimento(1);

    expect(() => result, throwsA(ServerException()));
  });

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
