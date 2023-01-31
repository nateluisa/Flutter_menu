import 'package:flutter/material.dart';
import 'package:flutter_project2/components/mainViewHome.dart';
import 'package:flutter_project2/login_page.dart';
import 'package:flutter_project2/pages/banks.dart';
import 'package:flutter_project2/pages/checks.dart';
import 'package:flutter_project2/pages/clients.dart';
import 'package:flutter_project2/pages/payment.dart';
import 'package:flutter_project2/pages/receive.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Albatros';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      color: Colors.white,
      home: Menu(title: appTitle),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key, required this.title});

  final String title;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            width: 60.0,
            child: PopupMenuButton<String>(
                icon: ClipOval(
                  child: Align(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: Image.asset('assets/clubs_logo.png'),
                  ),
                ),
                // onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: '1',
                      child: Text('Usuário: Isadora'),
                    ),
                    PopupMenuItem<String>(
                      value: '2',
                      child: Text('Precisa de ajuda?'),
                    ),
                    PopupMenuItem<String>(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      value: '3',
                      child: Text('Sair'),
                    ),
                  ];
                }),
          )
        ],
        centerTitle: true,
        title: const Text(
          '',
        ),
        backgroundColor: Color.fromARGB(255, 250, 173, 23),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255,250, 173, 23),
              ),
              accountName: Text(
                "Clubs Hamburgueria",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Olá, seja bem vindo(a)!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: Image.asset('assets/clubs_logo.png'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.book,
              ),
              title: const Text('Nosso menu'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ClientsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.timer,
              ),
              title: const Text('Acompanhe seu pedido'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BanksScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history,
              ),
              title: const Text('Historico de pedidos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => ChecksScreen(
                      checksContext: context,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet_outlined,
              ),
              title: const Text('Programa de pontos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => PaymentScreen(
                      paymentContext: context,
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [MainViewHome()],
        ),
      ),
    );
  }
}
