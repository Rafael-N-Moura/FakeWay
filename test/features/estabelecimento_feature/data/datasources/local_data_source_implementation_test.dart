import 'package:fake_way/core/errors/exceptions.dart';
import 'package:fake_way/features/estabelecimento_feature/data/datasources/estabelecimento_local_data_source_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/estabelecimento_mock.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

void main() {
  late EstabelecimentoLocalDatasourceImplementation localDataSource;
  late MockHiveInterface mockHiveInterface;
  late MockHiveBox mockHiveBox;

  setUp(() {
    mockHiveInterface = MockHiveInterface();
    mockHiveBox = MockHiveBox();
    localDataSource = EstabelecimentoLocalDatasourceImplementation();
  });

  test(
    'should return a list of favorite estabelecimento models',
    () async {
      when((() => mockHiveInterface.openBox(any())))
          .thenAnswer((_) async => mockHiveBox);
      when(() => mockHiveBox.isNotEmpty).thenReturn(true);
      when(() => mockHiveBox.keys).thenReturn([1]);
      when(() => mockHiveBox.get(any()))
          .thenAnswer((_) async => tEstabelecimentoModelMock);

      final result = await localDataSource.getAllFavoritesEstabelecimentos();

      verify(() => mockHiveInterface.openBox(any())).called(1);
      verify(() => mockHiveBox.get(any())).called(1);
      expect(result, [tEstabelecimentoModelMock]);
    },
  );
}
