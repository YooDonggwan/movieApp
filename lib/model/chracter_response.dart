import 'package:movieApp/model/character.dart';

class CharacterResponse {
  final List<Character> characters;
  final String error;

  CharacterResponse.fromJson(Map<String, dynamic> json)
   :characters = (json["characters"] as List).map((i) => new Character.fromJson(i)),
    error = "";

  CharacterResponse.withError(String errorValue)
   :characters = List(),
    error = errorValue;

}