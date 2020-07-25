import 'package:flutter/material.dart';
import 'package:movieApp/model/movie_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class SimilarMoviesBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>(); // behaviorsubject 클래스는 가장 최근에 받은 이벤트를 리스너가 받음

  getSimilarMovies(int id) async {
    MovieResponse response = await _repository.getSimilarMovies(id);
    _subject.sink.add(response);
  }

  void drainStream() { _subject.value = null; }
  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;

}

final similarMoviesBloc = SimilarMoviesBloc();