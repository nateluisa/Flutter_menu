import 'package:flutter/material.dart';

class MainViewHome extends StatelessWidget {
  const MainViewHome({
    super.key,
  });

  @override
  Widget build(context) {
    return SizedBox(
      height: 800,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.only(bottom: 85),

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    elevation: 3,
                    shadowColor: Colors.blueGrey,
                    color: Colors.blueGrey,
                    child: const SizedBox(
                      width: 350,
                      height: 160,
                      child: Center(
                          child: Text(
                            'Total de compras',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    elevation: 3,
                    shadowColor: Colors.blueGrey,
                    color: Colors.blueGrey,
                    child: const SizedBox(
                      width: 350,
                      height: 100,
                      child: Center(
                          child: Text(
                            'Total de contas a receber',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    elevation: 3,
                    shadowColor: Colors.blueGrey,
                    color: Colors.blueGrey,
                    child: const SizedBox(
                      width: 350,
                      height: 160,
                      child: Center(
                          child: Text(
                            'Total de cheques emitidos',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    elevation: 3,
                    shadowColor: Colors.blueGrey,
                    color: Colors.blueGrey,
                    child: const SizedBox(
                      width: 350,
                      height: 160,
                      child: Center(
                          child: Text(
                            'Total de vendas',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    elevation: 3,
                    shadowColor: Colors.blueGrey,
                    color: Colors.blueGrey,
                    child: const SizedBox(
                      width: 350,
                      height: 160,
                      child: Center(
                          child: Text(
                            'Total de produtos',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    elevation: 3,
                    shadowColor: Colors.blueGrey,
                    color: Colors.blueGrey,
                    child: const SizedBox(
                      width: 350,
                      height: 160,
                      child: Center(
                          child: Text(
                            'Total de clientes',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }


}


