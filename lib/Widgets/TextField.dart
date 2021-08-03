import 'package:flutter/material.dart';

class FieldText {
  textField(
    nomeController,
    textoCampo, {
    double? largura,
    var mascara,
    double? altura,
    confPadding,
    tipoTexto,
    bool? campoSenha,
    icone,
    double? sizeIcon,
    double? raioBorda,
    bool? enabled,
    double? fontSize,
    FontWeight? fontWeigth,
    Color? corTexto,
    Color? backgroundColor,
    double? fontLabel,
    maxLines,
    minLines,
    maxLength,
  }) {
    return Center(
      child: Container(
        width: largura,
        height: altura,
        padding: confPadding ??
            EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
        child: Center(
          child: TextFormField(
            minLines: minLines ?? 1,
            maxLines: maxLines ?? 1,
            maxLength: maxLength ?? maxLength,
            autofocus: false,
            enabled: enabled ?? true,
            keyboardType: tipoTexto ?? TextInputType.text,
            controller: nomeController,
            obscureText: campoSenha ?? false,
            style: new TextStyle(
              fontSize: fontSize ?? 20,
              color: corTexto ?? Colors.black,
              fontWeight: fontWeigth ?? FontWeight.w700,
            ),
            decoration: new InputDecoration(
              fillColor: backgroundColor,
              filled: backgroundColor == null ? false : true,
              prefixIcon: new Icon(
                icone,
                size: sizeIcon ?? 25,
              ),
              labelText: textoCampo,
              labelStyle: TextStyle(
                fontSize: fontLabel ?? 20,
              ),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(
                  raioBorda ?? 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
