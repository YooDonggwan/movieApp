import 'package:movieApp/model/movie_note_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class FirestoreMovieNoteBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieNoteResponse> _subject = BehaviorSubject<MovieNoteResponse>();

  getMovieNote() async {
    MovieNoteResponse response = await _repository.getMovieNote();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieNoteResponse> get subject => _subject;

}

final firestoreMovieNoteBloc = FirestoreMovieNoteBloc();