import 'package:flutter/material.dart';
import 'package:movieApp/bloc/get_firestore_movie_note_bloc.dart';
import 'package:movieApp/model/movie_note_response.dart';
import 'package:movieApp/tab2_mylist/widget/movie_feed.dart';
import 'package:movieApp/style/theme.dart' as Style;

class MovieNote extends StatefulWidget {
  @override
  _MovieNoteState createState() => _MovieNoteState();
}

// 영화 노트는 이미 본 영화에서 노트를 추가하면 포스터와 노트 내용이 피드 형식으로 나타나게 하기

class _MovieNoteState extends State<MovieNote> {

  @override
  void initState() {
    super.initState();
    firestoreMovieNoteBloc..getMovieNote();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieNoteResponse>(
      stream: firestoreMovieNoteBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieNoteResponse> snapshot) {
        if(snapshot.hasData){
          if(snapshot.data.error != null && snapshot.data.error.length >0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildMovieNoteScreenWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      }
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget _buildMovieNoteScreenWidget(MovieNoteResponse data) {
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