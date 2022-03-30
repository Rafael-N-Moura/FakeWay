import 'package:fake_way/features/fake_way/data/models/coordenata_model.dart';
import 'package:fake_way/features/fake_way/domain/entities/coordenada_entity.dart';

import 'date_mock.dart';

final tCoordenada = Coordenada(
    data: tDateTime,
    dispositivoId: 1,
    latitude: 1,
    longitude: 1,
    sensorId: 1,
    velocidade: 1);

final tCoordenadaModel = CoordenadaModel(
    dispositivoId: 1,
    sensorId: 1,
    data: tDateTime,
    latitude: 1,
    longitude: 1,
    velocidade: 1);
