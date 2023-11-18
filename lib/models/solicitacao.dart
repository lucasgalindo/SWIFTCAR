import 'TipoServico.dart';

class Solicitacao {
  String id;
  TipoServico tipoServico; 
  String localizacao;
  String descricao; 
  String dataHora;

  Solicitacao({
    required this.id,
    required this.tipoServico,
    required this.localizacao,
    required this.descricao,
    required this.dataHora,
  });

  Solicitacao.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        tipoServico = TipoServico.fromMap(map["tipoServico"]), 
        localizacao = map["localizacao"],
        descricao = map["descricao"],
        dataHora = map["dataHora"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "tipoServico": tipoServico.toMap(), 
      "localizacao": localizacao,
      "descricao": descricao,
      "dataHora": dataHora,
    };
  }

  
  void acessarInformacoesTipoServico() {
    print('ID do Tipo de Serviço: ${tipoServico.id}');
    print('Tipo de Serviço: ${tipoServico.tipo}');
    print('Preço do Serviço: ${tipoServico.preco}');
  }
}
