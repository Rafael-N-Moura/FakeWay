import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:hive/hive.dart';

part 'estabelecimento_model.g.dart';

@HiveType(typeId: 0)
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
