import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vollup/Model/UserModel.dart';
import 'package:vollup/View/Home_Page/Home_Page.dart';
import 'package:vollup/View/Login_Page/Login_Page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserModel userIsLogged = UserModel();
  //ESTA FUNÇÃO VERIFICA SE A OU NÃO USUARIO LOGADO NO SISTEMA, SE O USUARIO ESTIVER OU NÃO LOGADO, O USUARIO E DIRECIONADO PRA PAGINA PRINCIPAL OU PARA O LOGIN
  isLogged() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 5)).then((_) async {
      auth.authStateChanges().listen((User? user) {
        print(user);
        if (user == null) {
          userIsLogged.usuario = user;
          Get.to(() => LoginPage());
        } else {
          Get.to(() => HomePage());
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    this.isLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 10, 82, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                'LeoBank',
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
