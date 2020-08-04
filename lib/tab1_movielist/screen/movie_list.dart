import 'package:flutter/material.dart';
import 'package:movieApp/tab1_movielist/screen/movie_search_delegate.dart';
import 'package:movieApp/tab1_movielist/widgets/genres.dart';
import 'package:movieApp/tab1_movielist/widgets/now_playing.dart';
import 'package:movieApp/tab1_movielist/widgets/top_movies.dart';
import 'package:movieApp/style/theme.dart' as Style;

// 모든 영화 리스트 제공해주어야함
// 관객순 / 개봉순 / 장르별
// 재정리가 되어야 하므로 stateful이 맞는듯

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          '영화 찾기',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // showSearch()
              showSearch(context: context, delegate: MovieSearchDelegate());
            },
          ),
        ],
      ),
      backgroundColor: Style.Colors.mainColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          NowPlaying(),
          SizedBox(height: 13.0,),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "장르별 영화",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Style.Colors.titleColor,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          GenresScreen(),
          TopMovies(),
        ],
      ),
    );
          
  }
}

