import 'package:movieApp/model/teaser.dart';

class TeaserResponse {
  final List<Teaser> teaser;
  final String error;

  TeaserResponse.fromJson(Map<String, dynamic> json)
    : teaser = (json["results"] as List).map((i) => new Teaser.fromJson(i)).toList(),
      error = ""; 

  TeaserResponse.withError(String errorValue)
    : teaser = List(),
      error = errorValue;
}