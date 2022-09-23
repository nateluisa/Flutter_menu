import 'package:flutter/material.dart';
import 'package:flutter_project2/dao/clients_dao.dart';
import 'package:flutter_project2/home_page.dart';
import 'package:flutter_project2/model/clients.dart';
import 'package:flutter_project2/pages/clientsEdit.dart';
import 'package:flutter_project2/pages/clientsNew.dart';
import 'package:flutter_project2/pages/clientsView.dart';

class ClientsScreen extends StatelessWidget {
  final ClientsDao _dao = ClientsDao();

  ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme:
            IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Clientes",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            //Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => HomePage(
                  homeContext: context,
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
        future: _dao.findAllClients(),
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
                final List<Client> clients = snapshot.data as List<Client>;
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: 85),
                  itemBuilder: (context, index) {
                    final Client client = clients[index];
                    return _ClientItem(client);
                  },
                  itemCount: clients.length,
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
              builder: (contextNew) => ClientsNewScreen(
                clientsNewContext: context,
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

class _ClientItem extends StatelessWidget {
  final Client client;
  final ClientsDao _dao = ClientsDao();

  _ClientItem(this.client);

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
                  onTap: () {
                    if (client.id != null) {
                      _dao.updateClient(client).then((id) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ClientsEditScreen(clientsEditContext: context),
                          )));
                    }
                  },
                ),
                PopupMenuItem<String>(
                  value: '2',
                  onTap: () {
                    _dao.updateClient(client).then((id) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ClientsViewScreen(clientsViewContext: context),
                        )));
                  },
                  child: Text('Visualizar'),
                ),
                PopupMenuItem<String>(
                  onTap: () {
                    print('delete');
                    _dao.deleteClient(client.id).then((id) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ClientsScreen(),
                        )));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Cliente deletado!'),
                    ));
                  },
                  value: '3',
                  child: Text('Excluir'),
                ),
              ];
            }),
        title: Text(
          client.name,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          client.address,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
