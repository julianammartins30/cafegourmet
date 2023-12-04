import 'package:cafe_gourmet_sp/pages/estabelecimento/adicionar_produto.dart';
import 'package:cafe_gourmet_sp/pages/estabelecimento/administrar_pedidos.dart';
import 'package:cafe_gourmet_sp/pages/estabelecimento/gerenciar_estoque.dart';
import 'package:cafe_gourmet_sp/pages/estabelecimento/gerenciar_vendas.dart';
import 'package:cafe_gourmet_sp/util/user_padrao.dart';
import 'package:cafe_gourmet_sp/util/title_cafe_gourmet.dart';
import 'package:flutter/material.dart';

import '../../repositories/user_repository.dart';
import '../../services/sharedPreferencies.dart';
import '../login/login_page.dart';

class HomeEstabelecimentoPage extends StatefulWidget {
  const HomeEstabelecimentoPage({super.key});

  @override
  State<HomeEstabelecimentoPage> createState() =>
      _HomeEstabelecimentoPageState();
}

class _HomeEstabelecimentoPageState extends State<HomeEstabelecimentoPage> {
  UserRepository user = UserRepository();
  SharedPreferencesService shared = SharedPreferencesService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            titleCafeGourmet(),
            const SizedBox(
              height: 70,
            ),
            userPadrao(Icons.business_rounded),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "CAFÉ GOURMET SP",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GerenciarEstoquePage(),
                        ));
                  },
                  child: const Text("Gerenciar Estoque")),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdicionarProduto(),
                    ),
                  );
                },
                child: const Text("Adicionar Produtos"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdministrarPedidos(),
                    ),
                  );
                },
                child: const Text("Administrar Pedidos"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Gerenciarvendas(),
                    ),
                  );
                },
                child: const Text("Gerenciar Vendas"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () async {
                var navegar = Navigator.of(context);
                var token = await shared.getTokenEstabelecimento();
                await user.logout(token);
                await shared.logout();

                navegar.pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginHome(),
                ));
              },
              child: Text(
                "Sair",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                  inherit: true,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue[900],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            titleCafeGourmet()
          ],
        ),
      ),
    );
  }
}
