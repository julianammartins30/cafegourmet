import 'package:cafe_gourmet_sp/model/produto_model.dart';

class CartModel {
  String? username;
  String? email;
  String? acesso;
  List<ProdutoModel>? cart;
  String? sessionToken;
  String? endereco;

  CartModel(
      {this.username, this.email, this.acesso, this.cart, this.sessionToken});

  CartModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    acesso = json['acesso'];
    if (json['cart'] != null) {
      cart = <ProdutoModel>[];
      json['cart'].forEach((v) {
        cart!.add(ProdutoModel.fromJson(v));
      });
    }
    sessionToken = json['sessionToken'];
    endereco = json['endereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['acesso'] = acesso;
    if (cart != null) {
      data['cart'] = cart!.map((v) => v.toJson()).toList();
    } else {
      cart = [];
    }
    data['sessionToken'] = sessionToken;
    data['endereco'] = endereco;
    return data;
  }
}
