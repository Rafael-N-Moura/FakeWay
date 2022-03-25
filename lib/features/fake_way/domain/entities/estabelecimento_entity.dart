import 'package:equatable/equatable.dart';
import 'package:fake_way/features/fake_way/domain/entities/ativo_entity.dart';

class Estabelecimento extends Equatable {
  final int companyId;
  final String companyName;
  //final List<Ativo> ativos;

  const Estabelecimento({
    required this.companyId,
    required this.companyName,
    //required this.ativos,
  });

  @override
  List<Object?> get props => [
        companyId,
        companyName,
        //ativos,
      ];
}
