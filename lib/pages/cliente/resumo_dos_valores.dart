import 'dart:math';

import 'package:cafe_gourmet_sp/model/pedido_model.dart';
import 'package:cafe_gourmet_sp/pages/cliente/compra_realizada_page.dart';
import 'package:cafe_gourmet_sp/repositories/pedidos_repository.dart';
import 'package:cafe_gourmet_sp/repositories/user_repository.dart';
import 'package:cafe_gourmet_sp/services/sharedPreferencies.dart';
import 'package:flutter/material.dart';

import '../../util/title_cafe_gourmet.dart';

class ResumoValoresPage extends StatefulWidget {
  final int total;
  final int totalComTaxa;
  final List<dynamic> cart;
  final String tokenUser;
  const ResumoValoresPage(
      {super.key,
      required this.total,
      required this.totalComTaxa,
      required this.cart,
      required this.tokenUser});

  @override
  State<ResumoValoresPage> createState() => _ResumoValoresPageState();
}

class _ResumoValoresPageState extends State<ResumoValoresPage> {
  var objectId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarObjectId();
  }

  final PedidosRepository _pedidosRepository = PedidosRepository();
  final UserRepository _userRepository = UserRepository();

  buscarObjectId() async {
    objectId = await SharedPreferencesService().getObjectIdUser();
    setState(() {});
  }

  Map adicionarPedido(tipoDePagamento) {
    return PedidoModel(
            numeroDoPedido: Random().nextInt(100000),
            produtos: widget.cart,
            status: "PEDIDO NOVO",
            tipoDePagamento: tipoDePagamento,
            valor: widget.totalComTaxa.toString())
        .toJson();
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                  width: 30,
                ),
                const Text(
                  "Resumo dos Valores",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal:",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text("R\$ ${widget.total},00",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Taxa de entrega:",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text(
                    "R\$ 6,00",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("R\$: ${widget.totalComTaxa},00",
                          style: const TextStyle(fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Formas de pagamento",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          var navegar = Navigator.of(context);

                          var pedido = adicionarPedido("Cartão de Crédito");

                          await _pedidosRepository.criarPedido(pedido);

                          await _userRepository.adicionarNoCarinho(
                              widget.tokenUser, objectId, []);

                          navegar.push(
                            MaterialPageRoute(
                              builder: (context) => const CompraRealizada(),
                            ),
                          );
                        },
                        child: const Text("Cartão de Crédito"),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          var navegar = Navigator.of(context);
                          var pedido = adicionarPedido("Pix");

                          await _pedidosRepository.criarPedido(pedido);

                          await _userRepository.adicionarNoCarinho(
                              widget.tokenUser, objectId, []);

                          navegar.pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const CompraRealizada(),
                            ),
                          );
                        },
                        child: const Text("Pix"),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          var navegar = Navigator.of(context);

                          var pedido = adicionarPedido("Cartão de Crédito");

                          await _pedidosRepository.criarPedido(pedido);

                          await _userRepository.adicionarNoCarinho(
                              widget.tokenUser, objectId, []);

                          navegar.pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const CompraRealizada(),
                            ),
                          );
                        },
                        child: const Text("Dinheiro"),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          var navegar = Navigator.of(context);
                          var pedido = adicionarPedido("Cartão de Crédito");

                          await _pedidosRepository.criarPedido(pedido);
                          await _userRepository.adicionarNoCarinho(
                              widget.tokenUser, objectId, []);

                          navegar.pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const CompraRealizada(),
                            ),
                          );
                        },
                        child: const Text("Pagar na entrega"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
