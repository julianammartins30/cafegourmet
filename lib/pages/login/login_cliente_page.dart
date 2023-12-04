import 'package:cafe_gourmet_sp/model/login_model.dart';
import 'package:cafe_gourmet_sp/pages/cliente/criar_conta.dart';
import 'package:cafe_gourmet_sp/pages/home/home_cliente_page.dart';
import 'package:cafe_gourmet_sp/pages/home/home_estabelecimento_page.dart';
import 'package:cafe_gourmet_sp/repositories/login_repository.dart';
import 'package:cafe_gourmet_sp/services/sharedPreferencies.dart';
import 'package:flutter/material.dart';

class LoginClientePage extends StatefulWidget {
  const LoginClientePage({super.key});

  @override
  State<LoginClientePage> createState() => _LoginClientePageState();
}

class _LoginClientePageState extends State<LoginClientePage> {
  @override
  Widget build(BuildContext context) {
    LoginModel login = LoginModel();

    TextEditingController userLoginController =
        TextEditingController(text: "usertest");
    TextEditingController passwordLoginController =
        TextEditingController(text: "123");

    LoginRepository loginRepository = LoginRepository();

    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  // height: 600,
                  decoration: BoxDecoration(
                    color: Colors.cyan[900],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_circle_left_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        const Text(
                          "CLIENTE",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            inherit: true,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextFormField(
                            controller: userLoginController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),

                              label: Text(
                                "Usuário",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 3)),

                              // focusColor: Colors.blue,
                            ),
                            cursorColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: TextFormField(
                            controller: passwordLoginController,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),

                              label: Text(
                                "Senha",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 3)),

                              // focusColor: Colors.blue,
                            ),
                            cursorColor: Colors.white,
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            var navigator = Navigator.of(context);

                            login = await loginRepository.login(
                                userLoginController.text.trim(),
                                passwordLoginController.text.trim(),
                                "user");

                            if (login.acesso == "user") {
                              await SharedPreferencesService()
                                  .saveTokenUserSharedPreference(
                                      login.sessionToken!);
                              await SharedPreferencesService()
                                  .saveObjectIdUserSharedPreference(
                                      login.objectId!);

                              navigator.pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomeClientePage(),
                                ),
                              );
                            } else if (login.acesso == "admin") {
                              await SharedPreferencesService()
                                  .saveTokenEstabelecimentoSharedPreference(
                                      login.sessionToken!);

                              await SharedPreferencesService()
                                  .saveObjectIdUserSharedPreference(
                                      login.sessionToken!);

                              navigator.pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeEstabelecimentoPage(),
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.blueGrey[800]),
                              fixedSize: const MaterialStatePropertyAll(
                                  Size(150, 20))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Entrar"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.black)),
                          onPressed: () {},
                          child: const Text("Esqueceu a senha ?"),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.black)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CriarConta(),
                              ),
                            );
                          },
                          child: const Text("Criar Conta"),
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
