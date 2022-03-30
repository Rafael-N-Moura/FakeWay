import 'package:fake_way/features/fake_way/data/models/umidade_model.dart';
import 'package:fake_way/features/fake_way/domain/entities/umidade_entity.dart';

import 'date_mock.dart';

Umidade tUmidade =
    Umidade(dispositivoId: 1, sensorId: 2, data: tDateTime, umidade: 1);

UmidadeModel tUmidadeModel =
    UmidadeModel(dispositivoId: 1, sensorId: 2, data: tDateTime, umidade: 1);
