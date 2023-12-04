import 'package:cafe_gourmet_sp/model/produto_model.dart';
import 'package:cafe_gourmet_sp/pages/home/home_estabelecimento_page.dart';
import 'package:cafe_gourmet_sp/repositories/produto_repository.dart';

import 'package:flutter/material.dart';

import '../../util/colors/colors_padroes.dart';
import '../../util/title_cafe_gourmet.dart';

class AdicionarProduto extends StatefulWidget {
  const AdicionarProduto({super.key});

  @override
  State<AdicionarProduto> createState() => _AdicionarProdutoState();
}

class _AdicionarProdutoState extends State<AdicionarProduto> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  ProdutoRepository produto = ProdutoRepository();
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
                  "Adicionar Produtos",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                IconButton(
                    onPressed: () async {
                      var navegar = Navigator.of(context);

                      var produtoJson = ProdutoModel(
                              name: nameController.text,
                              descricao: descricaoController.text,
                              quantidade: int.parse(quantidadeController.text),
                              valor: int.parse(valorController.text),
                              ativo: true)
                          .toJson();

                      await produto.adicionarProduto(produtoJson);

                      navegar.pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeEstabelecimentoPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.save_outlined,
                      size: 35,
                    ))
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 5),
                                borderRadius: BorderRadius.circular(3)),
                            child: Image.asset("lib/assets/appstore.png",
                                scale: 15)),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                            controller: nameController,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              label: Text("Nome"),
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                            controller: valorController,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              label: Text("Valor"),
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: descricaoController,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              label: Text("Descrição"),
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Quantidade Disponiveis:",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: TextField(
                            controller: quantidadeController,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 3),
                              ),
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            keyboardType: TextInputType.number,
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
      ),
    );
  }
}
