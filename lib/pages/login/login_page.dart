import 'package:cafe_gourmet_sp/pages/login/login_cliente_page.dart';
import 'package:flutter/material.dart';

import 'login_estabelecimento_page.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CAFÉ GOURMET SP",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image(
                    image: AssetImage("lib/assets/appstore.png"),
                    width: 25,
                    height: 25,
                  ),
                  // Icon(
                  //   Icons.map,
                  //   size: 32,
                  // )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Deseja acessar como:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginEstabelecimentoPage(),
                              ),
                            );
                          },
                          child: const Column(
                            children: [
                              Icon(
                                Icons.business_outlined,
                                color: Colors.white,
                                size: 120,
                              ),
                              Text(
                                "ESTABELECIMENTO",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  inherit: true,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginClientePage(),
                              ),
                            );
                          },
                          child: const Column(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 120,
                              ),
                              Text(
                                "CLIENTE",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  inherit: true,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
