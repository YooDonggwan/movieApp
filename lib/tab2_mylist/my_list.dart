import 'package:flutter/material.dart';
import 'package:movieApp/tab2_mylist/screen/seen_movie_screen.dart';
import 'screen/movie_note_screen.dart';
import 'package:movieApp/style/theme.dart' as Style;
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
      backgroundColor: Style.Colors.mainColor,
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
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0,),
        child: ListView(
          children: <Widget>[
            Card(
              // 이미 본 영화 목록들을 포스터 형태로 스크롤 가능하게 만들면 좋을듯 - 피드처럼 만들고 한줄평 남길 수 있게 해보기
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeenMovieScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 10.0,),
            Card(
              child: ListTile(
                leading: Icon(Icons.movie_filter),
                title: Text(
                  '보고싶은 영화',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
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
            SizedBox(height: 10.0,),
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
      ),
    );
  }
}
