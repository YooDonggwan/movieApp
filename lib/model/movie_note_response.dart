import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieApp/model/movie_note.dart';

class MovieNoteResponse {
  final List<MovieNote> movieNote;
  final String error;

  MovieNoteResponse(
    this.movieNote, 
    this.error
  );

  MovieNoteResponse.fromSnapshot(List<DocumentSnapshot> snapshot)
  : movieNote = snapshot.map((i) => new MovieNote.fromSnapshot(i)),
    error = "";

  MovieNoteResponse.withError(String errorValue)
  : movieNote = List(),
    error = errorValue;

}
