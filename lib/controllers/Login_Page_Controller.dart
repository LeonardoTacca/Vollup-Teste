// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vollup/View/Home_Page/Home_Page.dart';
import 'package:vollup/Widgets/PopUps.dart';

class LoginPageController {
  FirebaseAuth auth = FirebaseAuth.instance;

  login(String email, String password, context) {
    var error = validate(email, password);
    if (error == null) {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((firebaseUser) {
        Get.to(() => HomePage());
      }).catchError((error) {
        return MsgPopup().msgFeedback(
            context,
            'Parece que seu email ou senha estão errados, tente novamente',
            'Ops!');
      });
    } else {
      return MsgPopup().msgFeedback(context, '$error', 'Ocorreu um erro!');
    }
  }

  validate(String email, String password) {
    if (email.isEmpty) {
      return 'o email não pode ficar vazio!';
    }
    if (password.isEmpty) {
      return 'a senha não pode ficar vazia!';
    }
  }
}
