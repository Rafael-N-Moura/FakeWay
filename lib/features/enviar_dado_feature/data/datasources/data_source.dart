import '../models/coordenata_model.dart';
import '../models/temperatura_model.dart';
import '../models/umidade_model.dart';

abstract class IDataSource {
  Future sendCoordenadaData(CoordenadaModel coordenada);
  Future sendTemperatureData(TemperaturaModel temperatura);
  Future sendUmidadeData(UmidadeModel umidade);
}
