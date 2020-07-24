import 'package:flutter/material.dart';
import 'package:movieApp/model/character_response.dart';
import 'package:movieApp/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class CharactersBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CharacterResponse> _subject = BehaviorSubject<CharacterResponse>(); // behaviorsubject 클래스는 가장 최근에 받은 이벤트를 리스너가 받음

  getCharacters(int id) async {
    CharacterResponse response = await _repository.getCharacter(id);
    _subject.sink.add(response);
  }

  void drainStream() { _subject.value = null; }
  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<CharacterResponse> get subject => _subject;

}

final chractersBloc = CharactersBloc();