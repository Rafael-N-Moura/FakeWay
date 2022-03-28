import '../../domain/entities/ativo_entity.dart';
import '../../domain/entities/coordenada_entity.dart';
import '../../domain/entities/estabelecimento_entity.dart';
import '../../domain/entities/temperatura_entity.dart';
import '../../domain/entities/umidade_entity.dart';

abstract class IDataSource {
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos();
  Future<List<AtivoModel>> getAllAtivosByEstabelecimento(int estabelecimentoId);
  Future sendCoordenadaData(Coordenada coordenada);
  Future sendTemperatureData(Temperatura temperatura);
  Future sendUmidadeData(Umidade umidade);
}
