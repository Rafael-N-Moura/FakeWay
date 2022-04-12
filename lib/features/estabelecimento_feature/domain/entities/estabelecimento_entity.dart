import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Estabelecimento extends Equatable {
  @HiveField(0)
  final int companyId;
  @HiveField(1)
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
