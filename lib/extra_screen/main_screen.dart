import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieApp/tab1_movielist/screen/movie_list.dart';
import 'package:movieApp/tab2_mylist/my_list.dart';
import 'package:movieApp/tab3_profile/profile.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {

  // firesbase initialize
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  ////// Widget
  var _index = 0;
  var _tabs = [
    MovieList(),
    MyList(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {

    if(_error){
      return Text('error!!');
    }

    if(!_initialized){
      return Text('Loading');
    }
    
    return Scaffold(
      body: _tabs[_index],
      backgroundColor: Colors.blueGrey[700],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              color: Colors.white,
            ),
            title: Text('영화찾기',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ), 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie,
              color: Colors.white,
            ),
            title: Text('영화 기록장',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
              color: Colors.white,
            ),
            title: Text('프로필',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
