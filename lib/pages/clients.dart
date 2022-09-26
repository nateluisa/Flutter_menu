import 'package:flutter/material.dart';
import 'package:flutter_project2/components/progress.dart';
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
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme:
            const IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
        backgroundColor: Colors.blueGrey,
        title: const Text(
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
          child: const Icon(
            Icons.arrow_back_outlined, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert),
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
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.data != null) {
                final List<Client> clients = snapshot.data as List<Client>;
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 85),
                  itemBuilder: (context, index) {
                    final Client client = clients[index];
                    return _ClientItem(client);
                  },
                  itemCount: clients.length,
                );
              }
              break;
          }
          return const Text('Erro ao realizar carregamento');
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
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

class _ClientItem extends StatelessWidget { // widget privado que fara parte apenas da tela cliente - lista
  final Client client;
  final ClientsDao _dao = ClientsDao();

  _ClientItem(this.client);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      shadowColor: Colors.blueGrey,
      child: ListTile(
        trailing: PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: '1',
                  child: const Text('Editar'),
                  onTap: () {
                    _dao.findById(client).then((cli) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ClientsEditScreen(
                              client: cli, clientsEditContext: context),
                        )));
                  },
                ),
                PopupMenuItem<String>(
                  value: '2',
                  onTap: () {
                    _dao.findById(client).then((cli) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ClientsViewScreen(
                              client: cli, clientsViewContext: context),
                        )));
                  },
                  child: const Text('Visualizar'),
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
                  child: const Text('Excluir'),
                ),
              ];
            }),
        title: Text(
          client.name,
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          client.adress,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
