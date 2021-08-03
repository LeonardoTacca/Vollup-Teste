import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vollup/Model/DbModel.dart';
import 'package:vollup/Widgets/MenuWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbModel homeController = DbModel();
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  var data;
  String userName = '';
  int balance = 0;
  //FUNCAO QUE BUSCA OS DADOS DO USUARIO PELO UUID
  getData() async {
    homeController.db
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        data = documentSnapshot;
        setState(() {
          userName = data['name'];
          balance = data['balance'];
        });
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 10, 82, 1),
      body: Container(
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              top: 50,
              left: 50,
              child: Text(
                'LEOBANK',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
              top: 95,
              left: 50,
              child: Text(
                'Saldo Atual',
                style: TextStyle(color: Colors.white, fontSize: 15),
              )),
          Positioned(
              top: 110,
              left: 50,
              child: Text(
                'R\$: ${balance.toStringAsFixed(3)}',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
          Positioned(
            top: size.height * 0.3,
            child: Container(
              height: size.height * 0.7,
              width: size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
          ),
          Positioned(
              bottom: size.height * 0.1,
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      child: Text('Ola, $userName',
                          style: TextStyle(
                              color: Color.fromRGBO(30, 10, 82, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.04)),
                    ),
                    Text('Qual sua proxima operação?',
                        style: TextStyle(
                            color: Color.fromRGBO(30, 10, 82, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.04)),
                    Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.05,
                            bottom: size.height * 0.05),
                        child: MenuWidgetsCustomizeds().separator(size)),
                    Row(
                      children: [
                        MenuWidgetsCustomizeds().menuItens(
                            Icon(
                              Icons.payment,
                            ),
                            'Pagar Contas'),
                        MenuWidgetsCustomizeds().menuItens(
                            Icon(Icons.money_outlined), 'Carregar Carteira'),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.05,
                            bottom: size.height * 0.05),
                        child: MenuWidgetsCustomizeds().separator(size)),
                    Row(
                      children: [
                        MenuWidgetsCustomizeds().menuItens(
                            Icon(Icons.list_sharp), 'Historico de Pagamentos'),
                        MenuWidgetsCustomizeds().menuItens(
                            Icon(Icons.payments), 'Fazer Transferencia'),
                      ],
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                color: Color.fromRGBO(233, 234, 236, 1),
                height: size.height * 0.1,
                width: size.width,
                child: Row(
                  children: [
                    Expanded(
                        child: IconButton(
                            onPressed: () => auth.signOut(),
                            icon: Icon(Icons.person),
                            iconSize: 40)),
                    Expanded(
                        child: IconButton(
                      onPressed: () => null,
                      icon: Icon(Icons.list_outlined),
                      iconSize: 40,
                    ))
                  ],
                ),
              )),
          Positioned(
            bottom: 12,
            child: Container(
              height: size.height * 0.10,
              width: size.width * 0.20,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(130, 207, 29, 1),
                  borderRadius: BorderRadius.circular(100)),
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  'L',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
