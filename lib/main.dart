import 'package:flutter/material.dart';
import 'package:movieApp/extra_screen/login_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moviary',
      // home: MovieApp(),
      home: LoginScreen()
    );
  }
}

