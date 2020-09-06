import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class FirestoreSeenMovieBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<List> _subject = BehaviorSubject<List>();

  getSeenMovieList() async {
    List<dynamic> response = await _repository.getSeenMovieList();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List> get subject => _subject;
}

final firestoreSeenMovieBloc = FirestoreSeenMovieBloc();