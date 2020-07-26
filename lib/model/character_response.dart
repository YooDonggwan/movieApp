import 'package:movieApp/model/character.dart';

class CharacterResponse {
  final List<Character> characters;
  final String error;

  CharacterResponse.fromJson(Map<String, dynamic> json)
   :characters = (json["cast"] as List).map((i) => new Character.fromJson(i)).toList(),
    error = "";

  CharacterResponse.withError(String errorValue)
   :characters = List(),
    error = errorValue;

}