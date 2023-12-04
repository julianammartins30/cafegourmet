import 'package:cafe_gourmet_sp/model/pedido_model.dart';
import 'package:dio/dio.dart';

class PedidosRepository {
  final _dio = Dio();

  PedidosRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "vNFcOi2CdrufLdgjNFoWsc1MhVpTxk80NoohPTO9";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "r7dqhUpHYf19CQmHd2CeHMwGXhYZoykcNUsB3PWF";
    // _dio.options.headers["X-Parse-Revocable-Session"] = 1;
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes/";
  }

  Future<List<PedidoModel>> buscarPedido() async {
    var pedidos = await _dio.get("Pedidos");

    var pedidosRefinado = (pedidos.data["results"] as List)
        .map((e) => PedidoModel.fromJson(e))
        .toList();

    return pedidosRefinado;
  }

  Future<void> criarPedido(Map pedido) async {
    await _dio.post("Pedidos", data: pedido);
  }

  Future<void> putPedido(Map pedido, String objectId) async {
    await _dio.put("Pedidos/$objectId", data: pedido);
  }
}
