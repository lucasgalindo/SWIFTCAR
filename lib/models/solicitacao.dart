import 'TipoServico.dart';

class Solicitacao {
  String id;
  TipoServico tipoServico; 
  String localizacao;
  String placa; 
  String model;

  Solicitacao({
    required this.id,
    required this.tipoServico,
    required this.localizacao,
    required this.placa,
    required this.model,
  });

  Solicitacao.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        tipoServico = TipoServico.fromMap(map["tipoServico"]), 
        localizacao = map["localizacao"],
        placa = map["descricao"],
        model = map["dataHora"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "tipoServico": tipoServico.toMap(), 
      "localizacao": localizacao,
      "descricao": placa,
      "dataHora": model,
    };
  }

  
}
