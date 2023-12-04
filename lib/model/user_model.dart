class UserModel {
  String? username;
  String? email;
  String? acesso;
  String? cpf;
  String? celular;
  String? endereco;

  UserModel(
      {this.username,
      this.email,
      this.acesso,
      this.cpf,
      this.celular,
      this.endereco});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    acesso = json['acesso'];

    cpf = json['cpf'];
    celular = json['celular'];
    endereco = json['endereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['acesso'] = acesso;
    data['cpf'] = cpf;
    data['celular'] = celular;
    data['endereco'] = endereco;
    return data;
  }
}
