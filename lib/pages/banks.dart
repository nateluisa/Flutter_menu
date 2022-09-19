import 'package:flutter/material.dart';
import 'package:flutter_project2/components/BankTable.dart';
import 'package:flutter_project2/pages/banksNew.dart';

class Banks extends StatefulWidget {

  const Banks({Key? key, required BuildContext banksContext,})
      : super(key: key);

  @override
  State<Banks> createState() => _BanksState();
}

class _BanksState extends State<Banks> {
  @override
  Widget build(BuildContext context) {
    bool opacidade = true;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
              'Bancos', style: TextStyle(
              color: Colors.white
          )
          ),
        ),
      ),
      body: ListView(children: [
        Row(
          children: [
            Container(
              child: Text(widget.bank),
            ),
            Container(
              child: Text(widget.agency),
            ),
            Container(
              child: Text(widget.account),
            )
          ],
        )
    ]),
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
