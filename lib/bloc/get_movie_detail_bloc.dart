import 'package:flutter/material.dart';
import 'package:movieApp/model/movie_detail_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class MovieDetailBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieDetailResponse> _subject = BehaviorSubject<MovieDetailResponse>(); // behaviorsubject 클래스는 가장 최근에 받은 이벤트를 리스너가 받음

  getMovieDetail(int id) async {
    MovieDetailResponse response = await _repository.getMovieDetail(id);
    _subject.sink.add(response);
  }

  void drainStream() { _subject.value = null; }
  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieDetailResponse> get subject => _subject;

}

final chractersBloc = MovieDetailBloc();