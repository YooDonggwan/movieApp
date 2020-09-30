import 'package:movieApp/model/movie_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class FirestoreMasterpieceBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getMasterpieceList() async {
    MovieResponse response = await _repository.getMasterpieceList();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final firestoreMasterpieceBloc = FirestoreMasterpieceBloc();