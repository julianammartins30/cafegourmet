import 'package:cafe_gourmet_sp/pages/home/home_cliente_page.dart';
import 'package:cafe_gourmet_sp/repositories/user_repository.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../../services/sharedPreferencies.dart';
import '../../util/title_cafe_gourmet.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  var nameController = TextEditingController();
  var cpfController = TextEditingController();
  var emailController = TextEditingController();
  var enderecoController = TextEditingController();
  var celularController = TextEditingController();

  bool isLoading = false;
  var tokenUser;
  var objectId;

  UserRepository userRepository = UserRepository();

  late UserModel user = UserModel();

  @override
  void initState() {
    super.initState();
    buscarInfoCliente();
  }

  buscarInfoCliente() async {
    setState(() {
      isLoading = true;
    });
    tokenUser = await SharedPreferencesService().getTokenUser();
    user = await userRepository.getUser(tokenUser);
    objectId = await SharedPreferencesService().getObjectIdUser();

    nameController = TextEditingController(text: user.username ?? "");
    cpfController = TextEditingController(text: user.cpf ?? "");
    emailController = TextEditingController(text: user.email ?? "");
    enderecoController = TextEditingController(text: user.endereco ?? "");
    celularController = TextEditingController(text: user.celular);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            titleCafeGourmet(),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: isLoading
                      ? const CircularProgressIndicator()
                      : const Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 35,
                        ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  "Meus Dados",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Informações Pessoais:",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Nome"),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cpfController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("CPF"),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: celularController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Celular"),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Dados de acesso:",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("E-mail"),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: TextEditingController(text: "********"),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Senha"),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Dados de Entraga:",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: enderecoController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Endereço"),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var navegar = Navigator.of(context);
                  var userNew = UserModel(
                          username: nameController.text,
                          cpf: cpfController.text,
                          celular: celularController.text,
                          email: emailController.text,
                          endereco: enderecoController.text,
                          acesso: "user")
                      .toJson();
                  await userRepository.editUser(tokenUser, objectId, userNew);

                  navegar.pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeClientePage(),
                    ),
                  );
                },
                child: const Text("Salvar Informações"))
          ],
        ),
      ),
    );
  }
}
