import 'package:flutter/material.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({Key? key, required this.receiveContext})
      : super(key: key);
  final BuildContext receiveContext;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Contas a receber',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomePage());
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contas a receber'),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search)),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {

            },
          ),
          IconButton(
             onPressed: () {
              // Navigator.pop(context);
             },
              icon: const Icon(Icons.arrow_back_outlined)),
        ],
      ),
    );
  }
}

// Search Page
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    // codigo para limpar seleçao do campo
                  },
                ),
                hintText: 'Buscar...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}
