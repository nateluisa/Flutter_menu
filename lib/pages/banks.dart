import 'package:flutter/material.dart';
import 'package:flutter_project2/dao/banks_dao.dart';
import 'package:flutter_project2/data/projectDB.dart';
import 'package:flutter_project2/home_page.dart';
import 'package:flutter_project2/model/banks.dart';
import 'package:flutter_project2/pages/banksNew.dart';

class BanksScreen extends StatelessWidget {

  final BanksDao _dao = BanksDao();
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => HomePage(homeContext: context,

                ),
              ),
            );
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
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.data != null) {
                final List<Bank> banks = snapshot.data as List<Bank>;
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: 85),
                  itemBuilder: (context, index) {
                    final Bank bank = banks[index];
                    return _BankItem(bank);
                  },
                  itemCount: banks.length,
                );
              } else {
                return Center(child: const Text('Sem registros'));
              }
              break;
          }
          return Text('Erro ao realizar carregamento');
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
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class _BankItem extends StatelessWidget {
  final Bank bank;
  final BanksDao _dao = BanksDao();
  _BankItem(this.bank);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 3,
      shadowColor: Colors.blueGrey,
      child: ListTile(
        trailing: PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: '1',
                  child: Text('Editar'),
                ),
                PopupMenuItem<String>(
                  value: '2',
                  child: Text('Visualizar'),
                ),
                PopupMenuItem<String>(
                  onTap: () {
                    print('delete');
                    _dao.deleteBank(bank.id).then((id) =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BanksScreen(),
                      ),
                    ));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text('Banco deletado!'),
                    ));
                  },
                  value: '3',
                  child: Text('Excluir'),
                ),
              ];
            }),
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
