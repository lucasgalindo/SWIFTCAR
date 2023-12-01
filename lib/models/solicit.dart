class SolicitMec {
  String id;
  String localizacao;
  String placa;
  String modelo;

  SolicitMec({
    required this.id,
    required this.localizacao,
    required this.placa,
    required this.modelo,
  });

  SolicitMec.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        localizacao = map["localizacao"],
        placa = map["placa"],
        modelo = map["modelo"];

  set userId(String userId) {}

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "localizacao": localizacao,
      "placa": placa,
      "modelo": modelo,
    };
  }
}
