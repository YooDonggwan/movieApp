import 'package:flutter/material.dart';
import 'package:movieApp/model/movie_note.dart';
import 'package:movieApp/style/theme.dart' as Style;

class MovieFeed extends StatefulWidget {
  // movie들을 리스트로 받아서 피드에 하나씩 풀어주면 될듯
  final MovieNote movieNote;

  MovieFeed({Key key, @required this.movieNote}) : super(key : key);

  @override
  _MovieFeedState createState() => _MovieFeedState(movieNote);
}

class _MovieFeedState extends State<MovieFeed> {
  final MovieNote movieNote;
  _MovieFeedState(this.movieNote);

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

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
                backgroundImage: NetworkImage(
                  "https://image.tmdb.org/t/p/w200/" +
                      movieNote.poster
                ),
                // backgroundColor: Colors.transparent,
                radius: 60.0,
                // backgroundImage: ,
              ),
              title: Text(
                movieNote.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                movieNote.date,
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