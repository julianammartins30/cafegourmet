class LoginModel {
  String? objectId;
  String? username;
  String? acesso;
  ProductId? productId;
  String? sessionToken;

  LoginModel(
      {this.objectId,
      this.username,
      this.acesso,
      this.productId,
      this.sessionToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    acesso = json['acesso'];
    productId = json['productId'] != null
        ? ProductId.fromJson(json['productId'])
        : null;
    sessionToken = json['sessionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['username'] = username;
    data['acesso'] = acesso;
    if (productId != null) {
      data['productId'] = productId!.toJson();
    }
    data['sessionToken'] = sessionToken;
    return data;
  }
}

class ProductId {
  String? objectId;

  ProductId({this.objectId});

  ProductId.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    return data;
  }
}
