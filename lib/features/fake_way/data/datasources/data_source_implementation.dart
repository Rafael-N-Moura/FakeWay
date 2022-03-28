import 'package:fake_way/features/fake_way/data/datasources/i_data_source.dart';
import 'package:fake_way/features/fake_way/domain/entities/umidade_entity.dart';
import 'package:fake_way/features/fake_way/domain/entities/temperatura_entity.dart';
import 'package:fake_way/features/fake_way/domain/entities/coordenada_entity.dart';
import 'package:fake_way/features/fake_way/data/models/estabelecimento_model.dart';
import 'package:fake_way/features/fake_way/data/models/ativo_model.dart';

class DataSourceImplementation extends IDataSource {
  @override
  Future<List<AtivoModel>> getAllAtivosByEstabelecimento(
      int estabelecimentoId) {
    // TODO: implement getAllAtivosByEstabelecimento
    throw UnimplementedError();
  }

  @override
  Future<List<EstabelecimentoModel>> getAllEstabelecimentos() {
    // TODO: implement getAllEstabelecimentos
    throw UnimplementedError();
  }

  @override
  Future sendCoordenadaData(Coordenada coordenada) {
    // TODO: implement sendCoordenadaData
    throw UnimplementedError();
  }

  @override
  Future sendTemperatureData(Temperatura temperatura) {
    // TODO: implement sendTemperatureData
    throw UnimplementedError();
  }

  @override
  Future sendUmidadeData(Umidade umidade) {
    // TODO: implement sendUmidadeData
    throw UnimplementedError();
  }
}
