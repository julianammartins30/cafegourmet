import 'package:cafe_gourmet_sp/model/produto_model.dart';
import 'package:dio/dio.dart';

class ProdutoRepository {
  final _dio = Dio();

  ProdutoRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "vNFcOi2CdrufLdgjNFoWsc1MhVpTxk80NoohPTO9";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "r7dqhUpHYf19CQmHd2CeHMwGXhYZoykcNUsB3PWF";
    // _dio.options.headers["X-Parse-Revocable-Session"] = 1;
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes/";
  }

  Future<void> adicionarProduto(Map<String, dynamic> produto) async {
    await _dio.post("Products", data: produto);
  }

  Future<List<ProdutoModel>> listarProdutos() async {
    var produtos = await _dio.get("Products");

    var produtosRefinados = (produtos.data["results"] as List)
        .map((e) => ProdutoModel.fromJson(e))
        .toList();

    return produtosRefinados;
  }

  Future<void> editarStatus(String objectId, Map data) async {
    await _dio.put("Products/$objectId", data: data);
  }

  Future<ProdutoModel> getProduto(String objectId) async {
    var response = await _dio.get("Products/$objectId");

    return ProdutoModel.fromJson(response.data);
  }

  Future<void> editProduto(String objectId, Map data) async {
    await _dio.put("Products/$objectId", data: data);
  }
}
