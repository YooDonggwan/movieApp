import 'package:cloud_firestore/cloud_firestore.dart';

import './movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final List<Movie> firestoreMovie;
  final String error;

  MovieResponse(this.movies, this.firestoreMovie, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
    : movies = (json["results"] as List).map((i) => new Movie.fromJson(i)).toList(),
      firestoreMovie = List(),
      error = "";

  MovieResponse.fromSnapshot(List<DocumentSnapshot> snapshot)
    : movies = List(),
      // firestoreMovie = Movie.fromSnapshot(snapshot),
      firestoreMovie = snapshot.map((i) => new Movie.fromSnapshot(i)).toList(),
      error = "";

  MovieResponse.withError(String errorValue)
    : movies = List(),
      firestoreMovie = List(),
      error = errorValue;
}