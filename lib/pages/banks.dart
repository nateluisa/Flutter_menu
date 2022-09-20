import 'package:flutter/material.dart';
import 'package:flutter_project2/data/projectDB.dart';
import 'package:flutter_project2/model/banks.dart';
import 'package:flutter_project2/pages/banksNew.dart';

class BanksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme:
            IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Bancos",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert),
              )),
        ],
      ),
        body: FutureBuilder(
          future: findAll(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              final List<Bank> banks = snapshot.data as List<Bank>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Bank bank = banks[index];
                  return _BankItem(bank);
                },
                itemCount: banks.length,
              );
            } else {
              return const Card();
            }
          },
        ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => BanksNewScreen(
                banksNewContext: context,
              ),
            ),
          ).then((newBank) => debugPrint(newBank.toString()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class _BankItem extends StatelessWidget {
  final Bank bank;

  _BankItem(this.bank);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('clicou');
        },
        title: Text(
          bank.name,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          bank.account.toString(),
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}


