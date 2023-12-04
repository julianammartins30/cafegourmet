import 'package:cafe_gourmet_sp/pages/cliente/cesto_compra_page.dart';
import 'package:cafe_gourmet_sp/pages/cliente/perfil_page.dart';
import 'package:cafe_gourmet_sp/pages/cliente/vitrine_virtual.dart';
import 'package:cafe_gourmet_sp/repositories/user_repository.dart';
import 'package:cafe_gourmet_sp/services/sharedPreferencies.dart';
import 'package:cafe_gourmet_sp/util/user_padrao.dart';
import 'package:cafe_gourmet_sp/util/title_cafe_gourmet.dart';
import 'package:flutter/material.dart';

import '../login/login_page.dart';

class HomeClientePage extends StatefulWidget {
  const HomeClientePage({super.key});

  @override
  State<HomeClientePage> createState() => _HomeClientePageState();
}

class _HomeClientePageState extends State<HomeClientePage> {
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
            userPadrao(Icons.person),
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
                          builder: (context) => const VitrineVirtual(),
                        ));
                  },
                  child: const Text("Vitrine Virtual")),
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
                      builder: (context) => const CestoCompraPage(),
                    ),
                  );
                },
                child: const Text("Cesto de Compras"),
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     style: const ButtonStyle(
            //       backgroundColor: MaterialStatePropertyAll(Colors.black),
            //       foregroundColor: MaterialStatePropertyAll(Colors.white),
            //     ),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const AdministrarPedidos(),
            //         ),
            //       );
            //     },
            //     child: const Text("Historico de Pedido"),
            //   ),
            // ),
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
                      builder: (context) => const PerfilPage(),
                    ),
                  );
                },
                child: const Text("Meus Dados"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () async {
                var navegar = Navigator.of(context);
                var token = await shared.getTokenUser();
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
