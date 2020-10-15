import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieApp/model/movie_note.dart';
import 'package:movieApp/style/theme.dart' as Style;

class ModifyMovieNoteScreen extends StatefulWidget {
  final MovieNote movieNote;

  ModifyMovieNoteScreen(this.movieNote);
  
  @override
  _ModifyMovieNoteScreenState createState() => _ModifyMovieNoteScreenState(movieNote);
}

class _ModifyMovieNoteScreenState extends State<ModifyMovieNoteScreen> {
  final MovieNote movieNote;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _textController = new TextEditingController();

  _ModifyMovieNoteScreenState(this.movieNote);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 30.0),
          Row( // 포스터 제목 날짜
            children: <Widget>[
              SizedBox(width: 20.0,),
              Container(
                height: 230.0,
                width: 150.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage("https://image.tmdb.org/t/p/original" +
                        movieNote.poster
                      ),
                      fit: BoxFit.cover
                    ),
                  ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.0)
                  ),
                )
              ),
              SizedBox(width: 10.0),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: [
                          Text(
                            '영화 제목:    ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            movieNote.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            ' 작성 날짜: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            movieNote.date,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          // 노트 입력란
          Container(
            margin: EdgeInsets.all(10),
            height: 350.0,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Container(
                color: Style.Colors.titleColor,
                child: TextField(
                  controller: _textController,
                  // onSubmitted: _handleSubmit,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '수정할 내용을 입력해주세요'
                  ),
                ),
              ),
            ),
          ),
          // 저장 버튼
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.lightBlue,
                  textColor: Colors.black,
                  onPressed: () {
                    firestore.collection('MovieNote')
                      .doc(movieNote.title)
                      .update({
                        'note_content': _textController.text
                      });
                    Navigator.pop(context);
                    // _handleSubmit(_textController.text);
                  }, 
                  child: Text(
                    '수정 완료',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                MaterialButton(
                  color: Colors.lightBlue,
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                    // _handleSubmit(_textController.text);
                  }, 
                  child: Text(
                    '취소',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}