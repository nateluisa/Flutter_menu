import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  LoginPage({Key? key, required this.loginContext}) : super(key: key);
  final BuildContext loginContext;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  //LoginService loginService = LoginService();

  final passwordValidator = (value) {
    if (value == '' || value == null) {
      return 'Informe a senha';
    }
  };

  final userValidator = (value) {
    if (value == '' || value == null) {
      return 'Informe o usuário';
    }
  };

  final companyValidator = (value) {
    if (value == '' || value == null) {
      return 'Informe a empresa';
    }
  };

  late String _dropdownError;
  late String _selectedItem;

  List categoryItemlist = [];



  //late TimerComponent timerComponent;
  Timer? timer;

  @override
  void initState() {
    super.initState();

  }

  static var companydropdownvalue;

  bool _passwordVisible = true;

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController applicationSourceController =
      TextEditingController(text: "MOBILE");


  @override
  void dispose() {
    super.dispose();
    userController.clear();
    passwordController.clear();
    applicationSourceController.clear();
  }

  @override
  Widget build(BuildContext context) {


    final logo = Container(
      padding: const EdgeInsets.only(
          top: 2.0, bottom: 2.0, left: 10.0, right: 10.0),
      child: Hero(
        tag: 'hero',
        child: Image.asset(
          'assets/clubs_logo.png',
          fit: BoxFit.contain,
          alignment: AlignmentDirectional.topEnd,
        ),
      ),
    );

    final form = SingleChildScrollView(
      child: Form(
        key: formKeyLogin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextFormField(

                obscureText: false,
                keyboardType: TextInputType.text,
                autofocus: false,
                controller: userController,
                validator: userValidator,
                decoration: InputDecoration(
                  label: const Text('Usuário'),
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                autofocus: false,
                controller: passwordController,
                validator: passwordValidator,
                obscureText: _passwordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: 20,
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons
                              .visibility, //change icon based on boolean value
                      color: Color.fromARGB(255,0, 0, 139),
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible =
                            !_passwordVisible; //change boolean value
                      });
                    },
                  ),
                  label: const Text('Senha'),
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 250, 173, 23)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ))),
          onPressed: () {

              login(

                  context);

          },
          child: const Text('Entrar', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/starter-image.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            // padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, top: 288.0, left: 25.0, right: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(1.0)),
                  child: Column(
                    children: [
                      logo,
                      form,

                      loginButton,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




Future<void> login(BuildContext context) async {
  //showPopupOnPageChange();
  Navigator.of(context).pushNamed(HomePage.tag);
}
