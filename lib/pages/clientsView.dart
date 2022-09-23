import 'package:flutter/material.dart';
import 'package:flutter_project2/dao/clients_dao.dart';

class ClientsViewScreen extends StatefulWidget {
  final name;
  final adress;
  final number;
  final district;
  final telephone;

  const ClientsViewScreen(
      {Key? key,
        this.name,
        this.adress,
        this.number,
        this.district,
        this.telephone,
        required BuildContext clientsViewContext})
      : super(key: key);

  @override
  State<ClientsViewScreen> createState() => _ClientsViewScreenState();
}

class _ClientsViewScreenState extends State<ClientsViewScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();

  final ClientsDao _dao = ClientsDao();

  // late Bank bank;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Visualizar cliente'),
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
                                      readOnly: true,
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        hintText: 'Nome',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _numberController,
                                        readOnly: true,
                                        decoration:
                                        (InputDecoration(hintText: 'Numero')),
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
                                controller: _adressController,
                                readOnly: true,
                                decoration:
                                (InputDecoration(hintText: 'Endereço')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _districtController,
                                readOnly: true,
                                decoration:
                                (InputDecoration(hintText: 'Bairro')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: _telephoneController,
                                readOnly: true,
                                decoration:
                                (InputDecoration(hintText: 'Telefone')),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
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
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Teste de input2',
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: TextField(
                                      decoration:
                                      InputDecoration(hintText: 'Teste de input3'),
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
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
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
