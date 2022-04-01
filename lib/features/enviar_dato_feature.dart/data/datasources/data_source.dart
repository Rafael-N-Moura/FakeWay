import 'package:fake_way/features/enviar_dato_feature.dart/data/models/coordenata_model.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/temperatura_model.dart';
import 'package:fake_way/features/enviar_dato_feature.dart/data/models/umidade_model.dart';

abstract class IDataSource {
  Future sendCoordenadaData(CoordenadaModel coordenada);
  Future sendTemperatureData(TemperaturaModel temperatura);
  Future sendUmidadeData(UmidadeModel umidade);
}
