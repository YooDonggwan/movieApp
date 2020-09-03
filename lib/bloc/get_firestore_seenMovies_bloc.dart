import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movieApp/model/movie_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreSeenMovieBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<Stream> _subject = BehaviorSubject<Stream>();

  getSeenMovieList() async {
    Stream<QuerySnapshot> response = await _repository.getSeenMovieList();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<Stream> get subject => _subject;
}

final firestoreSeenMovieBloc = FirestoreSeenMovieBloc();