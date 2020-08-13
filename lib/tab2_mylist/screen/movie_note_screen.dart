import 'package:flutter/material.dart';

class MovieNote extends StatefulWidget {
  @override
  _MovieNoteState createState() => _MovieNoteState();
}

// 영화 노트는 이미 본 영화에서 노트를 추가하면 포스터와 노트 내용이 피드 형식으로 나타나게 하기

class _MovieNoteState extends State<MovieNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Menu'),
    );
  }
}