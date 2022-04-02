import 'package:fake_way/features/enviar_dato_feature.dart/data/models/umidade_model.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/entities/umidade_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/umidade_entity_mock.dart';

void main() {
  test("should be a subclass of Umidade", () {
    expect(tUmidadeModel, isA<Umidade>());
  });

  test("should return a valid model", () {
    // Arrange
    final map = tUmidadeModel.toMap();

    // Act
    final result = UmidadeModel.fromJson(map);

    // Assert
    expect(result, tUmidadeModel);
  });
}
