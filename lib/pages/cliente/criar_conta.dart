import 'package:cafe_gourmet_sp/pages/login/login_cliente_page.dart';
import 'package:cafe_gourmet_sp/repositories/criar_conta_repository.dart';
import 'package:flutter/material.dart';

import '../../model/criar_conta_model.dart';
import '../../util/title_cafe_gourmet.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({super.key});

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  TextEditingController nameController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController celular = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController endereco = TextEditingController();

  CriarContaRepository contaRepository = CriarContaRepository();

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
                width: 70,
              ),
              const Text(
                "Criar Conta",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      label: Text("Nome Completo"),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    controller: nameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        label: Text("E-mail"),
                        labelStyle: TextStyle(color: Colors.black)),
                    controller: email,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        label: Text("Senha"),
                        labelStyle: TextStyle(color: Colors.black)),
                    controller: password,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        label: Text("Celular"),
                        labelStyle: TextStyle(color: Colors.black)),
                    controller: celular,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        label: Text("CPF"),
                        labelStyle: TextStyle(color: Colors.black)),
                    controller: cpf,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        label: Text("Endereço"),
                        labelStyle: TextStyle(color: Colors.black)),
                    controller: endereco,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.green[700]),
                      ),
                      onPressed: () async {
                        var navegar = Navigator.of(context);
                        var user = CriarContaModel(
                                username: nameController.text,
                                acesso: "user",
                                email: email.text,
                                password: password.text,
                                celular: celular.text,
                                cpf: cpf.text,
                                endereco: endereco.text)
                            .toJson();

                        await contaRepository.criarConta(user);

                        navegar.pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginClientePage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
