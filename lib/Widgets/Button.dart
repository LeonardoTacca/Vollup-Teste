import 'package:flutter/material.dart';

class Button {
  btnPattern(label, ontap(), Color color,
      {double? tamanhoLetra,
      fontWeight,
      double? altura,
      Color? corFonte,
      border,
      largura}) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Container(
            alignment: Alignment.center,
            height: altura ?? 45,
            width: largura ?? 320,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(3.0, 5.0),
                    blurRadius: 7)
              ],
              color: color,
              borderRadius: border ?? BorderRadius.circular(20),
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                ontap();
              },
              child: Text(
                label,
                style: TextStyle(
                    fontSize: tamanhoLetra ?? 28,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color: corFonte ?? Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
