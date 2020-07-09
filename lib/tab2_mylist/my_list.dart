import 'package:flutter/material.dart';
import './movie_note.dart';

// 3개의 메뉴
// 이미 본 영화 / 보고 싶은 영화 / 명작 보관함
// 이미 본 영화 or 명작보관함에 영화 일기장 만들기
class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: ListView(
        children: <Widget>[
          Card(
            // 이미 본 영화 목록들을 포스터 형태로 스크롤 가능하게 만들면 좋을듯 
            // 아니면 영화 포스터를 좌우로 스크롤 가능하게 만들고, 포스터 밑에 간단한 정보들이 뜨면 좋을 수도
            child: ListTile(
              leading: Icon(Icons.movie_creation),
              title: Text(
                '이미 본 영화',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.movie_filter),
              title: Text(
                '보고 싶은 영화',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_movies),
              title: Text(
                '명작보관함',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.event_note),
              title: Text(
                '영화 노트',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieNote()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
