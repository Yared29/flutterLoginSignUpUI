import 'package:flutterloginsignupui/screens/auth/authScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(10, 10, 10, 1),
          appBarTheme: AppBarTheme(
              backgroundColor: Color.fromRGBO(10, 10, 10, 1), elevation: 0.0)),
      home: AuthScreen(),
    );
  }
}
