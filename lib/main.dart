import 'package:flutter/material.dart';
import './tab1_movielist/movie_list.dart';
import './tab2_mylist/my_list.dart';
import './tab3_profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fltter demo',
      home: MovieApp(),
    );
  }
}

class MovieApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MovieApp> {
  var _index = 0;
  var _tabs = [
    MovieList(),
    MyList(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '나의 영화 기록함',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _tabs[_index],
      backgroundColor: Colors.blueGrey[700],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('영화찾기'), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('영화 기록장'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('프로필'),
          ),
        ],
      ),
    );
  }
}