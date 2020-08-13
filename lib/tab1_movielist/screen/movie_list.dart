import 'package:flutter/material.dart';
import 'package:movieApp/tab1_movielist/screen/movie_search_delegate.dart';
import 'package:movieApp/tab1_movielist/widgets/genres.dart';
import 'package:movieApp/tab1_movielist/widgets/now_playing.dart';
import 'package:movieApp/tab1_movielist/widgets/top_movies.dart';
import 'package:movieApp/style/theme.dart' as Style;

// 모든 영화 리스트 제공해주어야함
// 인기 / 신작 / 장르

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,
              size: 30.0,
            ),
            onPressed: () {
              // showSearch()
              showSearch(context: context, delegate: MovieSearchDelegate());
            },
          ),
        ],
      ),
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

