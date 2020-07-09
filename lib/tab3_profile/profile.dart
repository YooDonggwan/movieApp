import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}