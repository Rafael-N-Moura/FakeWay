import 'package:fake_way/core/http_client/http_client.dart';
import 'package:fake_way/features/fake_way/data/datasources/data_source_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/estalecimento_json_mock.dart';

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
      (_) async => HttpAnswer(data: estabelecimentoJsonMock, statusCode: 200),
    );
  }

  test('should call the get method with correct url', () async {
    sucessMock();

    await dataSource.getAllEstabelecimentos();

    verify((() => client.get(urlExpected))).called(1);
  });
}
