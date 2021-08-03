import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MsgPopup {
  // Nesta Popup, é disparada uma mensagem informativa para o usuário ficar consciente
  // de algo que aconteceu. É um popup que tem apenas um botão botão "OK"
  msgFeedback(BuildContext context, mensagem, titulo,
      {Color? corMsg, double? sizeTitulo, double? fontMsg, txtButton}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => new CupertinoAlertDialog(
        title: new Text(
          titulo,
          style: TextStyle(
            fontSize: sizeTitulo ?? 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: new Text(
          mensagem,
          style: TextStyle(
            fontSize: fontMsg ?? 18,
            color: corMsg ?? Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            focusColor: Colors.red,
            child: Text(
              txtButton ?? 'OK',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
