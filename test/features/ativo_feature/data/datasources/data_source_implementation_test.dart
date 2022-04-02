import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/http_client/http_client.dart';
import 'package:fake_way/features/ativo_feature/data/datasources/data_source_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/json_mock.dart';
import '../../../../mocks/lista_de_ativos_dois.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late DataSourceImplementation dataSource;
  late HttpClient client;

  setUp(() {
    client = MockHttpClient();
    dataSource = DataSourceImplementation(client);
  });

  sucessMock() {
    when(() => client.get(any())).thenAnswer(
      (_) async => HttpAnswer(data: jsonMock, statusCode: 200),
    );
  }

  failureMock() {
    when(() => client.get(any())).thenAnswer(
        (invocation) async => HttpAnswer(data: 'data', statusCode: 800));
  }

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
}
