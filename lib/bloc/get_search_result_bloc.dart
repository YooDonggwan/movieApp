import 'package:flutter/material.dart';
import 'package:movieApp/model/search_result_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class SearchResultBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<SearchResultResponse> _subject = BehaviorSubject<SearchResultResponse>();

  getSearchResult(String query) async {
    SearchResultResponse response = await _repository.getSearchResult(query);
    _subject.sink.add(response);
  }

  void drainStream() { _subject.value = null; }
  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<SearchResultResponse> get subject => _subject;

}

final searchResultBloc = SearchResultBloc();