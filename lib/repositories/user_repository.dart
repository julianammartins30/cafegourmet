import 'package:cafe_gourmet_sp/model/cart_model.dart';
import 'package:cafe_gourmet_sp/model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final _dio = Dio();

  UserRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "vNFcOi2CdrufLdgjNFoWsc1MhVpTxk80NoohPTO9";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "r7dqhUpHYf19CQmHd2CeHMwGXhYZoykcNUsB3PWF";
    _dio.options.baseUrl = "https://parseapi.back4app.com/";
    // _dio.options.headers["X-Parse-Session-Token"] = "r:${}"
  }

  Future<void> adicionarNoCarinho(
      String tokenUser, String objectId, List data) async {
    _dio.options.headers["X-Parse-Session-Token"] = tokenUser;

    _dio.put("users/$objectId", data: {"cart": data});
  }

  Future<List> getCard(String session) async {
    _dio.options.headers["X-Parse-Session-Token"] = session;

    var response = await _dio.get("users/me");

    return response.data["cart"];
  }

  Future<CartModel> getEndereco(String session) async {
    _dio.options.headers["X-Parse-Session-Token"] = session;

    var response = await _dio.get("users/me");

    return CartModel.fromJson(response.data);
  }

  Future<void> logout(String session) async {
    _dio.options.headers["X-Parse-Session-Token"] = session;

    await _dio.post("logout");
  }

  Future<UserModel> getUser(String token) async {
    _dio.options.headers["X-Parse-Session-Token"] = token;

    var response = await _dio.get("users/me");

    return UserModel.fromJson(response.data);
  }

  Future<void> editUser(String tokenUser, String objectId, Map data) async {
    _dio.options.headers["X-Parse-Session-Token"] = tokenUser;
    _dio.options.headers["Content-Type"] = "application/json";
    await _dio.put("users/$objectId", data: data);
  }
}
