

class Solicitacao {
  String id;
  String localizacao;
  String placa; 
  String modelo;

  Solicitacao({
    required this.id,
    required this.localizacao,
    required this.placa,
    required this.modelo,
  });

  Solicitacao.fromMap(Map<String, dynamic> map)
      : id = map["id"], 
        localizacao = map["localizacao"],
        placa = map["descricao"],
        modelo = map["dataHora"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "localizacao": localizacao,
      "descricao": placa,
      "dataHora": modelo,
    };
  }

  
}
