import 'package:flutter/material.dart';
import 'package:movieApp/style/theme.dart' as Style;

class MovieFeed extends StatefulWidget {

  // movie들을 리스트로 받아서 피드에 하나씩 풀어주면 될듯

  @override
  _MovieFeedState createState() => _MovieFeedState();
}

class _MovieFeedState extends State<MovieFeed> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Style.Colors.titleColor,
        height: 300.0,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 60.0,
                // backgroundImage: ,
              ),
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                child: Container(
                  color: Style.Colors.titleColor,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write your comments about movie'
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}