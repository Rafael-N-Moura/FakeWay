import '../models/ativo_model.dart';
import '../models/coordenata_model.dart';
import '../models/estabelecimento_model.dart';
import '../models/temperatura_model.dart';
import '../models/umidade_model.dart';

abstract class IDataSource {
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos();
  Future<List<AtivoModel>> getAllAtivosByEstabelecimento(int estabelecimentoId);
  Future sendCoordenadaData(CoordenadaModel coordenada);
  Future sendTemperatureData(TemperaturaModel temperatura);
  Future sendUmidadeData(UmidadeModel umidade);
}