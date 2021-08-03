import 'package:flutter/material.dart';

class MenuWidgetsCustomizeds {
  separator(size) {
    return Container(
      height: size.height * 0.01,
      child: Row(
        children: [
          Container(
            width: size.width * 0.3,
          ),
          Container(
            width: size.width * 0.07,
            color: Color.fromRGBO(130, 207, 29, 1),
          ),
          Container(
            width: size.width * 0.3,
          ),
          Container(
            width: size.width * 0.07,
            color: Color.fromRGBO(130, 207, 29, 1),
          ),
        ],
      ),
    );
  }

  menuItens(Icon icon, texto) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => null,
            icon: icon,
            color: Colors.black87,
            iconSize: 35,
          ),
          Text(
            texto,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Color.fromRGBO(30, 10, 82, 1),
            ),
          )
        ],
      ),
    );
  }
}
