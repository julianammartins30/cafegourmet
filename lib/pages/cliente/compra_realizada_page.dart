import 'package:cafe_gourmet_sp/pages/home/home_cliente_page.dart';
import 'package:flutter/material.dart';

class CompraRealizada extends StatefulWidget {
  const CompraRealizada({super.key});

  @override
  State<CompraRealizada> createState() => _CompraRealizadaState();
}

class _CompraRealizadaState extends State<CompraRealizada> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 150,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Pedido Realizado",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeClientePage(),
                      ),
                    );
                  },
                  child: const Text("Voltar a tela inicial"))
            ],
          ),
        ),
      ),
    );
  }
}
