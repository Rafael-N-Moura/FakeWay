import 'package:fake_way/core/utils/way_colors.dart';
import 'package:fake_way/features/estabelecimento_feature/domain/entities/estabelecimento_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/estabelecimento_controller.dart';

class EstabelecimentoCardWidget extends StatelessWidget {
  final Estabelecimento estabelecimento;
  EstabelecimentoCardWidget({Key? key, required this.estabelecimento})
      : super(key: key);

  final EstabelecimentoController controller =
      Modular.get<EstabelecimentoController>();

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
            Expanded(
              child: Text(
                estabelecimento.companyName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Raleway"),
              ),
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
      onLongPress: () async {
        bool? isFavorite = await controller
            .getStatusOfFavoriteEstabelecimento(estabelecimento.companyId);
        if (isFavorite == null) {
        } else {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              elevation: 10,
              context: context,
              builder: (BuildContext context) {
                return Wrap(
                  children: [
                    ListTile(
                        leading: Icon(
                          isFavorite ? Icons.remove : Icons.add,
                          color: isFavorite ? Colors.red : Colors.green,
                        ),
                        title: Text(
                          isFavorite
                              ? 'Remover ${estabelecimento.companyName} dos favoritos'
                              : 'Adicionar ${estabelecimento.companyName} aos favoritos',
                          style: TextStyle(
                              color: WayColors.primaryColor,
                              fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          isFavorite
                              ? controller.removeAFavoriteEstabelecimento(
                                  estabelecimento.companyId, context)
                              : controller.setAFavoriteEstabelecimento(
                                  estabelecimento, context);

                          Navigator.pop(context);
                        }),
                  ],
                );
              });
        }
      },
    );
  }
}
