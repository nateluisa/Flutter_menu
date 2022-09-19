import 'package:flutter/material.dart';
import 'package:flutter_project2/components/DataTable.dart';
import 'package:flutter_project2/pages/paymentNew.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key, required this.paymentContext})
      : super(key: key);
  final BuildContext paymentContext;

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
              'Contas a pagar', style: TextStyle(
              color: Colors.white
          )
          ),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: [
            DataGrid()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => PaymentNewScreen(
                paymentNewContext: context,
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
