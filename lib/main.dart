import 'package:fake_way/core/utils/colors.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/presentation/pages/enviar_dado_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() {
  runApp(
    // ModularApp(
    //   module: AppModule(),
    //   child: const AppWidget(),
    // ),
    MaterialApp(
      theme: ThemeData(
          primaryColor: CustomColors.primaryColor, fontFamily: 'Raleway'),
      home: EnviarDadoPage(),
    ),
  );
}
