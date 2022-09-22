import 'package:flutter/material.dart';

class MainViewHome extends StatelessWidget {
  const MainViewHome({
    super.key,
  });

  @override
  Widget build(context) {
    return Container(
      height: 200,
      child: SizedBox(
        child: Card(
          child: Text('Teste'),
        ),
      ),
    );
  }
}
