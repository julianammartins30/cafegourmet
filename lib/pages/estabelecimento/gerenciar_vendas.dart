import 'package:cafe_gourmet_sp/model/pedido_model.dart';
import 'package:flutter/material.dart';

import '../../repositories/pedidos_repository.dart';
import '../../util/colors/colors_padroes.dart';
import '../../util/title_cafe_gourmet.dart';

class Gerenciarvendas extends StatefulWidget {
  const Gerenciarvendas({super.key});

  @override
  State<Gerenciarvendas> createState() => _GerenciarvendasState();
}

class _GerenciarvendasState extends State<Gerenciarvendas> {
  var vendas = <PedidoModel>[];

  PedidosRepository pedidosRepository = PedidosRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarVendas();
  }

  void buscarVendas() async {
    vendas = await pedidosRepository.buscarPedido();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              const Text(
                "Gerenciar Vendas",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CONTAINER_PADRAO,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  itemCount: vendas.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Pedido ${vendas[index].numeroDoPedido}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Valor: R\$ ${vendas[index].valor},00",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        Text(
                          vendas[index].tipoDePagamento!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 18),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
