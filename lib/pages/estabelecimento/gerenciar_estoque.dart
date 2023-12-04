import 'package:cafe_gourmet_sp/model/produto_model.dart';
import 'package:cafe_gourmet_sp/pages/estabelecimento/editar_produto.dart';
import 'package:cafe_gourmet_sp/repositories/produto_repository.dart';
import 'package:cafe_gourmet_sp/services/sharedPreferencies.dart';
import 'package:cafe_gourmet_sp/util/title_cafe_gourmet.dart';
import 'package:flutter/material.dart';

import '../../util/colors/colors_padroes.dart';
import 'adicionar_produto.dart';

class GerenciarEstoquePage extends StatefulWidget {
  const GerenciarEstoquePage({super.key});

  @override
  State<GerenciarEstoquePage> createState() => _GerenciarEstoquePageState();
}

class _GerenciarEstoquePageState extends State<GerenciarEstoquePage> {
  var produtos = <ProdutoModel>[];
  var objectId;
  ProdutoRepository produtoRepo = ProdutoRepository();

  @override
  void initState() {
    super.initState();
    listarProdutos();
  }

  listarProdutos() async {
    produtos = await produtoRepo.listarProdutos();
    objectId = await SharedPreferencesService().getObjectIdEstabelecimento();
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
                  "Gerenciar Estoque",
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
                            builder: (context) => const AdicionarProduto(),
                          ));
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
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
                      )),
                  child: ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(5)),
                                  child:
                                      Image.asset("lib/assets/appstore.png")),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    produtos[index].name.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Text(
                                        produtos[index].quantidade.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Switch(
                                        value: produtos[index].ativo!,
                                        activeColor: Colors.green,
                                        onChanged: (value) async {
                                          await produtoRepo.editarStatus(
                                              produtos[index].objectId!,
                                              {"ativo": value});
                                          listarProdutos();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditarProduto(
                                                        objectId:
                                                            produtos[index]
                                                                .objectId!),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
