import 'package:cafe_gourmet_sp/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  final _dio = Dio();

  LoginRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "vNFcOi2CdrufLdgjNFoWsc1MhVpTxk80NoohPTO9";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "r7dqhUpHYf19CQmHd2CeHMwGXhYZoykcNUsB3PWF";
    _dio.options.headers["X-Parse-Revocable-Session"] = 1;

    _dio.options.baseUrl = "https://parseapi.back4app.com/";
  }

  Future<LoginModel> login(
      String userName, String password, String acesso) async {
    var response =
        await _dio.get("login?username=$userName&password=$password");

    return LoginModel.fromJson(response.data);
  }
}
