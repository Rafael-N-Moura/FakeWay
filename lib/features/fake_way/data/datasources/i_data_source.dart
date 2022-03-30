import '../../domain/entities/temperatura_entity.dart';
import '../../domain/entities/umidade_entity.dart';
import '../models/ativo_model.dart';
import '../models/coordenata_model.dart';
import '../models/estabelecimento_model.dart';

abstract class IDataSource {
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos();
  Future<List<AtivoModel>> getAllAtivosByEstabelecimento(int estabelecimentoId);
  Future sendCoordenadaData(CoordenadaModel coordenada);
  Future sendTemperatureData(Temperatura temperatura);
  Future sendUmidadeData(Umidade umidade);
}
