import 'package:cafe_gourmet_sp/pages/home_page.dart';
import 'package:cafe_gourmet_sp/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool token = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return token == false ? const LoginHome() : const HomePage();
  }
}
