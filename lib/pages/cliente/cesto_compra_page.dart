import 'package:cafe_gourmet_sp/model/cart_model.dart';
import 'package:cafe_gourmet_sp/pages/cliente/resumo_dos_valores.dart';
import 'package:cafe_gourmet_sp/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import '../../services/sharedPreferencies.dart';
import '../../util/title_cafe_gourmet.dart';

class CestoCompraPage extends StatefulWidget {
  const CestoCompraPage({super.key});

  @override
  State<CestoCompraPage> createState() => _CestoCompraPageState();
}

class _CestoCompraPageState extends State<CestoCompraPage> {
  UserRepository userRepository = UserRepository();

  var carts = [];
  var valorTotal;
  var tokenUser;
  var fullValue = 0;
  CartModel endereco = CartModel();

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarcarts();
  }

  buscarcarts() async {
    setState(() {
      isLoading = true;
    });
    tokenUser = await SharedPreferencesService().getTokenUser();
    carts = await userRepository.getCard(tokenUser);
    endereco = await userRepository.getEndereco(tokenUser);

    for (var e in carts) {
      fullValue += int.parse(e["valor"].toString());
    }

    setState(() {
      isLoading = false;
    });
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
                  "Cesto de Compras",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child:
                                        Image.asset("lib/assets/appstore.png"),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(carts[index]["name"]),
                                            Text(
                                                "R\$ ${carts[index]["valor"]},00")
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text("Excluir"),
                                            ),
                                            Text(carts[index]["quantidade"]
                                                .toString())
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("R\$: $fullValue",
                          style: const TextStyle(fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: const Icon(
                        Icons.map_outlined,
                        size: 40,
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(endereco.endereco.toString())
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total com Entrega:",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("R\$: ${fullValue == 0 ? fullValue : fullValue + 6}",
                          style: const TextStyle(fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: carts.isEmpty
                  ? const ElevatedButton(
                      onPressed: null,
                      child: Text("Continuar"),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResumoValoresPage(
                              total: fullValue,
                              totalComTaxa: fullValue + 6,
                              cart: carts,
                              tokenUser: tokenUser,
                            ),
                          ),
                        );
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(56, 142, 60, 1),
                        ),
                      ),
                      child: const Text("Continuar"),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
