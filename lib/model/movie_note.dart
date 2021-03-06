import 'package:cloud_firestore/cloud_firestore.dart';

class MovieNote {
  final String poster;
  final String title;
  final String date;
  final String noteContent;
  
  MovieNote(
    this.poster,
    this.title,
    this.date,
    this.noteContent
  );

  MovieNote.fromSnapshot(DocumentSnapshot snapshot)
  : poster = snapshot.data()["poster_path"],
    title = snapshot.data()["title"],
    date = snapshot.data()["date"],
    noteContent = snapshot.data()["note_content"];

}