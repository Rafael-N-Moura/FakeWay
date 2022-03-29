import 'dart:convert';

import 'package:fake_way/features/fake_way/data/models/estabelecimento_model.dart';
import 'package:fake_way/features/fake_way/domain/entities/estabelecimento_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/estabelecimento_mock.dart';

void main() {
  test("should be a subclass of EstabelecimentoEntity", () async {
    expect(tEstabelecimentoMock, isA<Estabelecimento>());
  });

  test("should return a valid model", () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(tEstabelecimentoJsonMock);

    // Act
    final result = EstabelecimentoModel.fromJson(jsonMap);

    // Assert
    expect(result, tEstabelecimentoMock);
  });
}
