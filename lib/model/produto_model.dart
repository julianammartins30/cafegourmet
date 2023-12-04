class ProdutoModel {
  String? objectId;
  String? name;
  int? valor;
  String? descricao;

  int? quantidade;
  bool? ativo;

  ProdutoModel(
      {this.name,
      this.valor,
      this.descricao,
      this.quantidade,
      this.ativo,
      this.objectId});

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    name = json['name'];
    valor = json['valor'];
    descricao = json['descricao'];

    quantidade = json['quantidade'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['name'] = name;
    data['valor'] = valor;
    data['descricao'] = descricao;
    data['quantidade'] = quantidade;
    data['ativo'] = ativo;
    return data;
  }
}
