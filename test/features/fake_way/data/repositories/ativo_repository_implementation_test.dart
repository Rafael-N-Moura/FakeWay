import 'package:fake_way/features/fake_way/data/repositories/ativo_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements IDataSource {}

class IDataSource {}

void main() {
  late AtivoRepositoryImplementation repository;
  late IDataSource dataSource;

  setUp(() {
    dataSource = MockDataSource();
    repository = AtivoRepositoryImplementation(dataSource);
  });
}
