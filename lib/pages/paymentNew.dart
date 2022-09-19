import 'package:flutter/material.dart';
import 'package:flutter_project2/components/DataTable.dart';

class PaymentNewScreen extends StatelessWidget {
  const PaymentNewScreen({Key? key, required this.paymentNewContext})
      : super(key: key);
  final BuildContext paymentNewContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme:
        IconThemeData(size: 30.0, color: Colors.white, opacity: 10.0),
        backgroundColor: Colors.blueGrey,
        title: Text("Nova a pagar", style: TextStyle(
            color: Colors.white
        ),),
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

      body: ListView(children: [
        Container()
      ]),
    );
  }
}
