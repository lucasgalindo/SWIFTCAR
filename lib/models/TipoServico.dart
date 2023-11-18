class TipoServico {
  String id;
  String tipo;
  String preco;
  
  

  TipoServico({
    required this.id,
    required this.tipo,
    required this.preco, 
  });

  TipoServico.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        tipo = map["tipo"],
        preco = map["preco"];
        
        

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "tipo": tipo,
      "preco": preco,
    };
  }
}
