import 'package:flutter/material.dart';
import 'package:flutter_project2/login_page.dart';
import 'package:flutter_project2/pages/banks.dart';
import 'package:flutter_project2/pages/checks.dart';
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
                    child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/147/147135.png'),
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
          'Albatros',
        ),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(color: Colors.blueGrey,

              ),
              accountName: Text(
                "Albatros mobile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Move Tecnologia",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: Image.asset('assets/logo-menu.png'),
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
                Icons.account_balance,
              ),
              title: const Text('Bancos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => Banks(banksContext: context,),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.money_sharp,
              ),
              title: const Text('Cheques'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => ChecksScreen(checksContext: context,),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.money_off,
              ),
              title: const Text('A pagar'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => PaymentScreen(paymentContext: context,),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.attach_money,
              ),
              title: const Text('A receber'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (contextNew) => ReceiveScreen(receiveContext: context,),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: const Text('Configurações'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
