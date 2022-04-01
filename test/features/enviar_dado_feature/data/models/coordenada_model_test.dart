import 'package:fake_way/features/enviar_dato_feature.dart/data/models/coordenata_model.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/domain/entities/coordenada_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/coordenada_entity_mock.dart';

void main() {
  test("should be a subclass of Coordenada", () {
    expect(tCoordenadaModel, isA<Coordenada>());
  });

  test("should return a valid model", () {
    // Arrange
    final map = tCoordenadaModel.toMap();

    // Act
    final result = CoordenadaModel.fromJson(map);

    // Assert
    expect(result, tCoordenadaModel);
  });
}
