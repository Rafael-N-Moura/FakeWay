import 'package:fake_way/features/fake_way/domain/entities/estabelecimento_entity.dart';

class EstabelecimentoModel extends Estabelecimento {
  const EstabelecimentoModel({
    required int companyId,
    required String companyName,
  }) : super(
          companyId: companyId,
          companyName: companyName,
        );

  factory EstabelecimentoModel.fromJson(Map<String, dynamic> json) =>
      EstabelecimentoModel(
        companyId: json['company'],
        companyName: json['companyName'],
      );
}
