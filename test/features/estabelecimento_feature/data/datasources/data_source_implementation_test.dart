import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/core/http_client/http_client.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/data_source_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/json_mock.dart';
import '../../../../mocks/lista_de_estabelecimentos_mock.dart';

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
}
