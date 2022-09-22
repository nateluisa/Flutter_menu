import 'package:flutter/material.dart';
import 'package:flutter_project2/dao/banks_dao.dart';
import 'package:flutter_project2/data/projectDB.dart';
import 'package:flutter_project2/model/banks.dart';
import 'package:flutter_project2/pages/banks.dart';

class BanksNewScreen extends StatefulWidget {
  final bank;
  final agency;
  final account;

  const BanksNewScreen(
      {Key? key,
      this.bank,
      this.agency,
      this.account,
      required BuildContext banksNewContext})
      : super(key: key);

  @override
  State<BanksNewScreen> createState() => _BanksNewScreenState();
}

class _BanksNewScreenState extends State<BanksNewScreen> {
  final TextEditingController _bankController = TextEditingController();

  final TextEditingController _agencyController = TextEditingController();

  final TextEditingController _accountController = TextEditingController();

  final BanksDao _dao = BanksDao();
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
                title: const Text('Novo banco'),
                actions: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          print('salvou');
                          final String name = _bankController.text;
                          final int account =
                              int.parse(_accountController.text);
                          final int agency = int.parse(_agencyController.text);
                          final Bank newBank = Bank(
                            0,
                            name,
                            agency,
                            account,
                          );
                          _dao.save(newBank).then((id) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BanksScreen(),
                            ),
                          ));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Criado com Sucesso!'),
                          ));
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _bankController,
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
                                    controller: _agencyController,
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
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: _accountController,
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
