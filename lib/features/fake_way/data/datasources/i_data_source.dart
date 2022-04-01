import '../models/ativo_model.dart';
import '../../../enviar_dato_feature.dart/data/models/coordenata_model.dart';
import '../../../estabelecimento_feature/data/models/estabelecimento_model.dart';
import '../../../enviar_dato_feature.dart/data/models/temperatura_model.dart';
import '../../../enviar_dato_feature.dart/data/models/umidade_model.dart';

abstract class IDataSource {
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos();
  Future<List<AtivoModel>> getAllAtivosByEstabelecimento(int estabelecimentoId);
  Future sendCoordenadaData(CoordenadaModel coordenada);
  Future sendTemperatureData(TemperaturaModel temperatura);
  Future sendUmidadeData(UmidadeModel umidade);
}
