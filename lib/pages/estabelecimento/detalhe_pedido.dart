import 'package:flutter/material.dart';

import '../../util/title_cafe_gourmet.dart';

class DetalhePedido extends StatefulWidget {
  const DetalhePedido({super.key});

  @override
  State<DetalhePedido> createState() => _DetalhePedidoState();
}

class _DetalhePedidoState extends State<DetalhePedido> {
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
                "Detalhe do Pedido:",
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
                  color: Colors.blueGrey[300],
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "PEDIDO XXXX",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Resumo do Pedido:",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Image.asset(
                                          "lib/assets/appstore.png")),
                                  const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        Text("Nome do produto"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Quantidade")
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  const Text("R\$")
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total:",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text("R\$: -",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green[700]),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Aceitar Pedido",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red[700]),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Recusar Pedido",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
