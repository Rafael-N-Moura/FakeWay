import 'dart:convert';

import 'package:fake_way/features/ativo_feature/data/models/ativo_model.dart';
import 'package:fake_way/features/ativo_feature/domain/entities/ativo_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/ativo_mock.dart';

void main() {
  test("should be a subclass of AtivoEntity", () async {
    expect(tAtivoModelMock, isA<Ativo>());
  });

  test("should return a valid model", () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(tAtivoJsonMock);

    // Act
    final result = AtivoModel.fromJson(jsonMap);

    // Assert
    expect(result, tAtivoModelMock);
  });
}
