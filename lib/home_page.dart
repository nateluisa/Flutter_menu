import 'package:flutter/material.dart';
import 'package:flutter_project2/components/menu.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  const HomePage({Key? key, required this.homeContext}) : super(key: key);
  final BuildContext homeContext;
  @override
  Widget build(BuildContext context) {
   return Menu(title: 'Albatros');
  }
}
