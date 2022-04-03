import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EstabelecimentoCardWidget extends StatelessWidget {
  final Estabelecimento estabelecimento;
  const EstabelecimentoCardWidget({Key? key, required this.estabelecimento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              estabelecimento.companyName,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Raleway"),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: WayColors.primaryColor,
            )
          ]),
        ),
      ),
      onTap: () {
        Modular.to.pushNamed('/ativo-module/', arguments: estabelecimento);
      },
    );
  }
}
