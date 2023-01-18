import 'package:flutter/material.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/app/helpers/helpers_prefs.dart';
import 'package:transevilz/login/login.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  bool _isAuth = true;
  bool _pinUsr = false;
  _checkPin() async {
    Helpers.getUsrPin().then((usrPin) {
      if (usrPin) {
        setState(() {
          _pinUsr = usrPin;
        });
      }
    });
  }

  _checkAuth() async {
    Helpers.getToken().then((token) {
      if (token == '') {
        setState(() {
          _isAuth = false;
        });
      }
    });
  }

  @override
  initState() {
    _checkAuth();
    _checkPin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_isAuth)
        ? (_pinUsr)
            ? const MainMenu()
            : const PinScreen()
        : const LoginScreen();
    // if (_isAuth) {
    //   if (_pinUsr) {
    //     print("main menu : $_pinUsr");
    //     return MainMenu();
    //   } else {
    //     print("pin : $_pinUsr");
    //     return PinScreen();
    //   }
    // } else {
    //   print("Login  : $_isAuth");
    //   return LoginScreen();
    // }
  }
}
