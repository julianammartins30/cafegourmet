import 'package:cafe_gourmet_sp/model/produto_model.dart';

class PedidoModel {
  String? objectId;
  int? numeroDoPedido;
  String? valor;
  String? tipoDePagamento;
  String? status;
  List? produtos;

  PedidoModel(
      {this.objectId,
      this.numeroDoPedido,
      this.valor,
      this.tipoDePagamento,
      this.status,
      this.produtos});

  PedidoModel.fromJson(Map<String, dynamic> json) {
    objectId = json["objectId"];
    numeroDoPedido = json['numeroDoPedido'];
    valor = json['valor'];
    tipoDePagamento = json['tipoDePagamento'];
    status = json['status'];
    if (json['produtos'] != null) {
      produtos = <ProdutoModel>[];
      json['produtos'].forEach((v) {
        produtos!.add(ProdutoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["objectId"] = objectId;
    data['numeroDoPedido'] = numeroDoPedido;
    data['valor'] = valor;
    data['tipoDePagamento'] = tipoDePagamento;
    data['status'] = status;

    data['produtos'] = produtos;

    return data;
  }
}
