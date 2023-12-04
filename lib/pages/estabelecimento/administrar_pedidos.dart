import 'package:cafe_gourmet_sp/model/pedido_model.dart';
import 'package:cafe_gourmet_sp/repositories/pedidos_repository.dart';
import 'package:flutter/material.dart';

import '../../util/colors/colors_padroes.dart';
import '../../util/title_cafe_gourmet.dart';

class AdministrarPedidos extends StatefulWidget {
  const AdministrarPedidos({super.key});

  @override
  State<AdministrarPedidos> createState() => _AdministrarPedidosState();
}

class _AdministrarPedidosState extends State<AdministrarPedidos> {
  PedidosRepository pedidosRepo = PedidosRepository();

  var pedidos = <PedidoModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listarPedidos();
  }

  listarPedidos() async {
    pedidos = await pedidosRepo.buscarPedido();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            titleCafeGourmet(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 35,
                  ),
                ),
                const SizedBox(
                  width: 45,
                ),
                const Text(
                  "Administrar Pedidos:",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: pedidos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: CONTAINER_PADRAO,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  pedidos[index].status!,
                                  style: TextStyle(
                                      color: pedidos[index].status! ==
                                              "PEDIDO NOVO"
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "PEDIDO ${int.parse(pedidos[index].numeroDoPedido.toString())}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Text(
                              "R\$ ${pedidos[index].valor!},00",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                              onPressed: () async {
                                await pedidosRepo.putPedido(
                                    {"status": "ROTA DE ENTREGA"},
                                    pedidos[index].objectId!);

                                listarPedidos();
                              },
                              icon: const Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
