import 'package:flutter/material.dart';
import 'package:flutter_project2/components/DataTable.dart';
import 'package:flutter_project2/data/bank_inherited.dart';

class BanksNewScreen extends StatefulWidget {


  const BanksNewScreen({Key? key, required this.banksNewContext})
      : super(key: key);
  final BuildContext banksNewContext;

  @override
  State<BanksNewScreen> createState() => _BanksNewScreenState();
}

class _BanksNewScreenState extends State<BanksNewScreen> {
  TextEditingController bankController = TextEditingController();
  TextEditingController agencyController = TextEditingController();
  TextEditingController accountController = TextEditingController();

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
                title: const Text('Novo banco'),
                actions: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            BankInherited.of(widget.banksNewContext).newBanks( // pegou o contexto que foi trazido para o form
                                bankController.text,
                                int.parse(agencyController.text),
                                int.parse(accountController.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Novo banco criado'),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Icon(Icons.check),
                      ),
                    ),
                  ),
                ],
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.account_balance),
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
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: bankController,
                                        validator: (String? value) {
                                          if (value != null && value.isEmpty) {
                                            return 'Informe o nome do banco';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Banco',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: TextFormField(
                                      controller: agencyController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Informe a agência';
                                        }
                                      },
                                      decoration: (InputDecoration(
                                          hintText: 'Agência')),
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: accountController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe a conta';
                                  }
                                },
                                decoration:
                                    (InputDecoration(hintText: 'Conta')),
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
                                      hintText: 'Banco',
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
                                      hintText: 'Banco',
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration:
                                      InputDecoration(hintText: 'Agência'),
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
                                      hintText: 'Comprovantes',
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Comprovantes2'),
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
