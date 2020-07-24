import 'package:flutter/material.dart';
import 'package:movieApp/model/teaser_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class TeasersBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<TeaserResponse> _subject = BehaviorSubject<TeaserResponse>(); // behaviorsubject 클래스는 가장 최근에 받은 이벤트를 리스너가 받음

  getTeasers(int id) async {
    TeaserResponse response = await _repository.getTeasers(id);
    _subject.sink.add(response);
  }

  void drainStream() { _subject.value = null; }
  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<TeaserResponse> get subject => _subject;

}

final teasersBloc = TeasersBloc();