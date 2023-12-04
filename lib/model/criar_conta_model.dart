class CriarContaModel {
  String? username;
  String? password;
  String? acesso;
  String? email;
  String? cpf;
  String? celular;
  String? endereco;

  CriarContaModel(
      {this.username,
      this.password,
      this.acesso,
      this.email,
      this.cpf,
      this.celular,
      this.endereco});

  CriarContaModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    acesso = json['acesso'];
    email = json['email'];
    cpf = json['cpf'];
    celular = json['celular'];
    endereco = json['endereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['acesso'] = acesso;
    data['email'] = email;
    data['cpf'] = cpf;
    data['celular'] = celular;
    data['endereco'] = endereco;
    return data;
  }
}
