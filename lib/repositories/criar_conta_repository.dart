import 'package:dio/dio.dart';

class CriarContaRepository {
  final _dio = Dio();

  CriarContaRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "vNFcOi2CdrufLdgjNFoWsc1MhVpTxk80NoohPTO9";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "r7dqhUpHYf19CQmHd2CeHMwGXhYZoykcNUsB3PWF";
    _dio.options.headers["X-Parse-Revocable-Session"] = 1;
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/";
  }

  Future<void> criarConta(Map user) async {
    await _dio.post("users", data: user);
  }
}
