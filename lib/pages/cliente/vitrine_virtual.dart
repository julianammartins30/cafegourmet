import 'package:cafe_gourmet_sp/model/produto_model.dart';
import 'package:cafe_gourmet_sp/pages/cliente/cesto_compra_page.dart';
import 'package:cafe_gourmet_sp/repositories/produto_repository.dart';
import 'package:cafe_gourmet_sp/repositories/user_repository.dart';
import 'package:cafe_gourmet_sp/services/sharedPreferencies.dart';
import 'package:flutter/material.dart';

import '../../util/title_cafe_gourmet.dart';

class VitrineVirtual extends StatefulWidget {
  const VitrineVirtual({super.key});

  @override
  State<VitrineVirtual> createState() => _VitrineVirtualState();
}

class _VitrineVirtualState extends State<VitrineVirtual> {
  ProdutoRepository produtoRepository = ProdutoRepository();
  UserRepository userRepository = UserRepository();

  var produtos = <ProdutoModel>[];
  var tokenUser;
  var objectId;
  var cart = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarProdutos();
  }

  void buscarProdutos() async {
    setState(() {
      isLoading = true;
    });
    produtos = await produtoRepository.listarProdutos();
    tokenUser = await SharedPreferencesService().getTokenUser();
    objectId = await SharedPreferencesService().getObjectIdUser();
    cart = await userRepository.getCard(tokenUser);
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
                  "Vitrine Virtual",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CestoCompraPage(),
                        ));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_sharp,
                    size: 35,
                  ),
                )
              ],
            ),
            Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: produtos.length,
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
                                      child: Image.asset(
                                          "lib/assets/appstore.png"),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 65,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(produtos[index].name!),
                                            Text(produtos[index].descricao!)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      var produto = ProdutoModel(
                                              name: produtos[index].name,
                                              quantidade:
                                                  produtos[index].quantidade,
                                              valor: produtos[index].valor,
                                              ativo: produtos[index].ativo,
                                              descricao:
                                                  produtos[index].descricao)
                                          .toJson();
                                      cart.add(produto);
                                      await userRepository.adicionarNoCarinho(
                                          tokenUser, objectId, cart);
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color.fromRGBO(
                                                    56, 142, 60, 1))),
                                    child: const Text("Adicionar"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
