import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movieApp/model/movie.dart';
import 'package:movieApp/style/theme.dart' as Style;

class MakeNoteScreen extends StatefulWidget {
  final Movie movie;
  MakeNoteScreen({Key key, @required this.movie}) : super(key : key);

  @override
  _MakeNoteScreenState createState() => _MakeNoteScreenState(movie);
}

class _MakeNoteScreenState extends State<MakeNoteScreen> {
  final Movie movie;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _textController = new TextEditingController();

  _MakeNoteScreenState(this.movie);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat('yyyy/MM/dd').format(DateTime.now());

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
                        movie.poster
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
                            movie.title,
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
                            date,
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
                    hintText: '영화를 보고 노트에 내용을 입력해주세요'
                  ),
                ),
              ),
            ),
          ),
          // 저장 버튼
          Container(
            child:MaterialButton(
              color: Colors.lightBlue,
              textColor: Colors.black,
              onPressed: () {
                firestore.collection('MovieNote')
                  .doc(movie.title)
                  .set({
                    'poster_path': movie.poster,
                    'title': movie.title,
                    'date': date,
                    'note_content': _textController.text
                  });
                Navigator.pop(context);
                // _handleSubmit(_textController.text);
              }, 
              child: Text(
                '노트에 저장하기',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void _handleSubmit(String text){
  //    _textController.clear();
  // }
}