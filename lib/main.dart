import 'package:flutter/material.dart';
import 'package:movieApp/tab1_movielist/screen/movie_list.dart';
import 'package:movieApp/tab2_mylist/my_list.dart';
import 'package:movieApp/tab3_profile/profile.dart';

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
        backgroundColor: Colors.blueGrey,
        title: Text(
          'M o v i a r y',
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
