import 'package:flutter/material.dart';
import 'package:vollup/Model/UserModel.dart';
import 'package:vollup/Widgets/Button.dart';
import 'package:vollup/Widgets/TextField.dart';
import 'package:vollup/controllers/Login_Page_Controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  UserModel user = UserModel();
  @override
  void initState() {
    super.initState();
    email.addListener(() {
      final String text = email.text.toLowerCase();
      email.value = email.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    password.addListener(() {
      final String text = password.text.toLowerCase();
      password.value = password.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(color: Colors.blue[900]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.2),
                child: Text(
                  'LeoBank',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    top: size.height * 0.1,
                    bottom: size.height * 0.05),
                child: Center(
                  child: Container(
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: FieldText().textField(
                            email,
                            'Usuario',
                          ),
                        ),
                        FieldText().textField(
                          password,
                          'Senha',
                          campoSenha: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: Button().btnPattern(
                              'Entrar',
                              () => {
                                    LoginPageController().login(
                                        email.text, password.text, context)
                                  },
                              Colors.blue.shade900,
                              corFonte: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.02),
                          child: GestureDetector(
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: null,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Não tem uma conta ainda? Cadastre-se Agora mesmo tocando aki!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
