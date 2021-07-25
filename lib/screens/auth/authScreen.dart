import 'package:flutter/material.dart';

import 'signInScreen.dart';
import 'signUpScreen.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool toggle = true;
  changeToggle() {
    setState(() {
      toggle = !toggle;
    });
    print(toggle);
  }

  @override
  Widget build(BuildContext context) {
    if (toggle) {
      return SignUpScreen(changeToggle: changeToggle);
    } else {
      return SignInScreen(changeToggle: changeToggle);
    }
  }
}
