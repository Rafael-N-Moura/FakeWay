import 'package:fake_way/features/enviar_dado_feature/data/models/temperatura_model.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/temperatura_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/temperatura_entity_mock.dart';

void main() {
  test("should be a subclass of Temperatura", () {
    expect(tTemperatureModel, isA<Temperatura>());
  });

  test("should return a valid model", () {
    // Arrange
    final map = tTemperatureModel.toMap();

    // Act
    final result = TemperaturaModel.fromJson(map);

    // Assert
    expect(result, tTemperatureModel);
  });
}
