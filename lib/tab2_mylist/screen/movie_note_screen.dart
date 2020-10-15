import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieApp/bloc/get_firestore_movie_note_bloc.dart';
import 'package:movieApp/model/movie_note.dart';
import 'package:movieApp/model/movie_note_response.dart';
import 'package:movieApp/tab2_mylist/screen/modify_movie_note_screen.dart';
import 'package:movieApp/tab2_mylist/widget/movie_feed.dart';
import 'package:movieApp/style/theme.dart' as Style;

class MovieNoteScreen extends StatefulWidget {

  @override
  _MovieNoteScreenState createState() => _MovieNoteScreenState();
}

// 영화 노트는 이미 본 영화에서 노트를 추가하면 포스터와 노트 내용이 피드 형식으로 나타나게 하기

class _MovieNoteScreenState extends State<MovieNoteScreen> {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firestoreMovieNoteBloc..getMovieNote();
  }

  @override 
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieNoteResponse>(
        stream: firestoreMovieNoteBloc.subject.stream,
        builder: (context, AsyncSnapshot<MovieNoteResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildMovieNoteScreenWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        });
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
    List<MovieNote> movieNoteList = data.movieNote;

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
          scrollDirection: Axis.vertical,
          itemCount: movieNoteList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                color: Style.Colors.titleColor,
                height: 250.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w200/" +
                            movieNoteList[index].poster
                        ),
                      ),
                      title: Text(
                        movieNoteList[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        movieNoteList[index].date,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: FlatButton.icon(
                              icon: Icon(Icons.create),
                              label: Text('수정'),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ModifyMovieNoteScreen(movieNoteList[index])
                                )).then((value) => setState(() {
                                  firestoreMovieNoteBloc..getMovieNote();
                                }));
                              },
                            ),
                          ),
                          PopupMenuItem(
                            child: FlatButton.icon(
                              icon: Icon(Icons.delete),
                              label: Text('삭제'),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      '삭제하시겠습니까?',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    actions: [
                                      Row(
                                        children: [
                                          FlatButton(
                                            child: Text('삭제'),
                                            onPressed: () {
                                              _firestore.collection("MovieNote")
                                                .doc(movieNoteList[index].title)
                                                .delete();
                                              setState(() {
                                                firestoreMovieNoteBloc..getMovieNote();
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                          FlatButton(
                                            child: Text('취소'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],  
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                        child: Container(
                          color: Style.Colors.titleColor,
                          child: Text(
                            movieNoteList[index].noteContent,
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
          },
        )
      ),
    );
  }
}