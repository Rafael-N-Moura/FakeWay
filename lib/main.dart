import 'package:fake_way/features/ativo_feature/data/models/ativo_model.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/coordenata_model.dart';
import 'package:fake_way/features/enviar_dado_feature/data/models/umidade_model.dart';
import 'package:fake_way/features/estabelecimento_feature/data/models/estabelecimento_model.dart';
import 'package:fake_way/features/historico_feature/data/models/historico_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_module.dart';
import 'app_widget.dart';
import 'features/enviar_dado_feature/data/models/temperatura_model.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(EstabelecimentoModelAdapter());
  Hive.registerAdapter(HistoricoModelAdapter());
  Hive.registerAdapter(AtivoModelAdapter());
  Hive.registerAdapter(TemperaturaModelAdapter());
  Hive.registerAdapter(CoordenadaModelAdapter());
  Hive.registerAdapter(UmidadeModelAdapter());

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
