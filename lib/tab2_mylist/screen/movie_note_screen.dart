import 'package:flutter/material.dart';
import 'package:movieApp/tab2_mylist/widget/movie_feed.dart';
import 'package:movieApp/style/theme.dart' as Style;

class MovieNote extends StatefulWidget {
  @override
  _MovieNoteState createState() => _MovieNoteState();
}

// 영화 노트는 이미 본 영화에서 노트를 추가하면 포스터와 노트 내용이 피드 형식으로 나타나게 하기

class _MovieNoteState extends State<MovieNote> {
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
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => MovieFeed(),
        )
      ),
    );
  }
}