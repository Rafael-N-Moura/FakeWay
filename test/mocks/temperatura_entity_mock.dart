import 'package:fake_way/features/enviar_dado_feature/data/models/temperatura_model.dart';
import 'package:fake_way/features/enviar_dado_feature/domain/entities/temperatura_entity.dart';

import 'date_mock.dart';

final tTemperature = Temperatura(
    dispositivoId: 1, sensorId: 1, data: tDateTime, temperatura: 1.0);

final tTemperatureModel = TemperaturaModel(
    dispositivoId: 1, sensorId: 1, data: tDateTime, temperatura: 1.0);
