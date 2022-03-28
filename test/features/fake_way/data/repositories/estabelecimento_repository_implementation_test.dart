import 'package:fake_way/features/fake_way/data/datasource/i_data_source.dart';
import 'package:fake_way/features/fake_way/data/repositories/estabelecimento_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements IDataSource {}

void main() {
  late EstabelecimentoRepositoryImplementation repository;
  late IDataSource dataSource;

  setUp(() {
    dataSource = MockDataSource();
    repository = EstabelecimentoRepositoryImplementation(dataSource);
  });
}
