import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_project2/home_page.dart';
import 'package:flutter_project2/initial_pages/starter_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(
          loginContext: context,
        ),
    HomePage.tag: (context) => HomePage(
          homeContext: context,
        ),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clubs Hamburgueria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Roboto',
      ),
      home: LoginPage(loginContext: context),
      routes: routes,
    );
  }
}


