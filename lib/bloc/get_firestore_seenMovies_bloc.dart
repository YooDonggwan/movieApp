import 'package:movieApp/model/movie_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class FirestoreSeenMovieBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getSeenMovieList() async {
    MovieResponse response = await _repository.getSeenMovieList();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final firestoreSeenMovieBloc = FirestoreSeenMovieBloc();