import 'package:flutter/material.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';
import '../model/person_response.dart';

class PersonListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject = BehaviorSubject<PersonResponse>();

  getMovies() async {
    PersonResponse response = await _repository.getPerson();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
  

  BehaviorSubject<PersonResponse> get subject => _subject;

}

final personsBloc = PersonListBloc();