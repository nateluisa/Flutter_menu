import 'package:flutter/material.dart';
import 'package:flutter_project2/dao/clients_dao.dart';
import 'package:flutter_project2/model/clients.dart';
import 'package:flutter_project2/pages/clients.dart';

import '../home_page.dart';

class ClientsEditScreen extends StatefulWidget {
  final name;
  final adress;
  final number;
  final district;
  final telephone;

  const ClientsEditScreen(
      {Key? key,
      this.name,
      this.adress,
      this.number,
      this.district,
      this.telephone,
      required BuildContext clientsEditContext})
      : super(key: key);

  @override
  State<ClientsEditScreen> createState() => _ClientsEditScreenState();
}

class _ClientsEditScreenState extends State<ClientsEditScreen> {


  // String? _mandatoryValidator(String text) {
  //   return (text.isEmpty ?? true) ? 'Required' : null;
  // }

  @override
  Widget build(BuildContext context) {
    final ClientsDao _dao = ClientsDao();

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
        future: _dao.updateClient(client),
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
                    Text('Carregando informações'),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              //if (snapshot.data != null) {
                final List<Client> clients = snapshot.data as List<Client>;
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: 85),
                  itemBuilder: (context, index) {
                    final Client client = clients[index];
                    return _ClientItem(client);
                  },
                  itemCount: clients.length,
                );
              // } else {
              //   return Center(
              //       child: const Text('Sem dados'));
              // }
              break;
          }
          return Text('Erro ao realizar carregamento');
        },
      ),
    );
  }
}

class _ClientItem extends StatelessWidget {
  final Client client;
  final ClientsDao _dao = ClientsDao();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();

  _ClientItem(this.client);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Scaffold(
        body: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Editar cliente'),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        print('salvou');
                        final String name = _nameController.text;
                        final String adress = _adressController.text;
                        final int number = int.parse(_numberController.text);
                        final String district = _districtController.text;
                        final int telephone =
                            int.parse(_telephoneController.text);
                        final Client editedClient = Client(
                            0, name, adress, number, district, telephone);
                        _dao
                            .saveClient(editedClient)
                            .then((id) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ClientsScreen(),
                                  ),
                                ));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Criado com Sucesso!'),
                        ));
                      },
                      child: const Icon(Icons.check),
                    ),
                  ),
                ],
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.account_box_outlined),
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                    ),
                    Tab(
                      icon: Icon(Icons.add),
                    ),
                    Tab(
                      icon: Icon(Icons.add_a_photo_rounded),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  ListView(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: client.name,
                                      controller: _nameController,
                                      validator: (String? value) {
                                        if (value != null && value.isEmpty) {
                                          return 'Informe o nome';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        hintText: 'Nome',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    //initialValue: client.number,
                                    controller: _numberController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Informe o numero';
                                      }
                                      return null;
                                    },
                                    decoration: (const InputDecoration(
                                        hintText: 'Numero')),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: client.adress,
                                controller: _adressController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o endereço';
                                  }
                                  return null;
                                },
                                decoration: (const InputDecoration(
                                    hintText: 'Endereço')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: client.district,
                                controller: _districtController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o bairro';
                                  }
                                  return null;
                                },
                                decoration:
                                    (const InputDecoration(hintText: 'Bairro')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                //initialValue: toString(client.telephone),
                                keyboardType: TextInputType.phone,
                                controller: _telephoneController,
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Informe o telefone';
                                  }
                                  return null;
                                },
                                decoration: (const InputDecoration(
                                    hintText: 'Telefone')),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Teste de input',
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Teste de input2',
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Teste de input3'),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Teste de input4',
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Teste de input 5'),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
    // return Card(
    //   elevation: 3,
    //   shadowColor: Colors.blueGrey,
    //   child: ListTile(
    //
    //     title: Text(
    //       client.name,
    //       style: TextStyle(fontSize: 18),
    //     ),
    //     subtitle: Text(
    //       client.adress,
    //       style: TextStyle(fontSize: 15),
    //     ),
    //   ),
    // );
  }
}
