import 'package:flutter/material.dart';
import 'package:movieApp/style/theme.dart' as Style;

class SeenMovie extends StatefulWidget {
  @override
  _SeenMovieState createState() => _SeenMovieState();
}

class _SeenMovieState extends State<SeenMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'M o v i a r y',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27.0,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Style.Colors.mainColor,
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: Column(
          children: <Widget>[
            
            Container(
              color: Style.Colors.titleColor,
              height: 300.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('어벤져스 : 인피니티 워',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('2020/08/13',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: ,
                  // ),
                  Expanded(
                    child: Container(
                      color: Style.Colors.titleColor,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write your comments about movie'
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}