import 'package:flutter/material.dart';

import '../../model/login_model.dart';
import '../../repositories/login_repository.dart';
import '../../services/sharedPreferencies.dart';
import '../../util/colors/colors_padroes.dart';
import '../home/home_cliente_page.dart';
import '../home/home_estabelecimento_page.dart';

class LoginEstabelecimentoPage extends StatefulWidget {
  const LoginEstabelecimentoPage({super.key});

  @override
  State<LoginEstabelecimentoPage> createState() =>
      _LoginEstabelecimentoPageState();
}

class _LoginEstabelecimentoPageState extends State<LoginEstabelecimentoPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userLoginController = TextEditingController();
    TextEditingController passwordLoginController = TextEditingController();

    bool carregando = false;

    LoginRepository loginRepository = LoginRepository();
    LoginModel login = LoginModel();

    return SafeArea(
      child: Scaffold(
        body: Column(children: [
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
                    color: CONTAINER_PADRAO,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: carregando
                      ? const CircularProgressIndicator()
                      : SingleChildScrollView(
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
                                "ESTABELECIMENTO",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
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
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.blueGrey[800]),
                                      fixedSize: const MaterialStatePropertyAll(
                                          Size(150, 20))),
                                  onPressed: () async {
                                    var navigator = Navigator.of(context);

                                    login = await loginRepository.login(
                                        userLoginController.text,
                                        passwordLoginController.text,
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
                                          builder: (context) =>
                                              const HomeClientePage(),
                                        ),
                                      );
                                    } else if (login.acesso == "admin") {
                                      await SharedPreferencesService()
                                          .saveTokenEstabelecimentoSharedPreference(
                                              login.sessionToken!);

                                      await SharedPreferencesService()
                                          .saveObjectIdEstabelecimentoSharedPreference(
                                              login.objectId!);
                                      navigator.pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeEstabelecimentoPage(),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.check),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Entrar"),
                                    ],
                                  )),
                              const SizedBox(
                                height: 100,
                              ),
                              TextButton(
                                  style: const ButtonStyle(
                                      foregroundColor: MaterialStatePropertyAll(
                                          Colors.black)),
                                  onPressed: () {},
                                  child: const Text("Esqueceu a senha ?"))
                            ],
                          ),
                        ),
                )),
          ),
        ]),
      ),
    );
  }
}
