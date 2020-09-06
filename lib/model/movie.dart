import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  Movie(
    this.id,
    this.popularity,
    this.title,
    this.backPoster,
    this.poster,
    this.overview,
    this.rating,
  );

  Movie.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    popularity = json["popularity"],
    title = json["title"],
    backPoster = json["backdrop_path"],
    poster = json["poster_path"],
    overview = json["overview"],
    rating = json["vote_average"].toDouble();

  Movie.fromSnapshot(DocumentSnapshot snapshot)
  : id = snapshot.data()["id"],
    popularity = snapshot.data()["popularity"],
    title = snapshot.data()["title"],
    backPoster = snapshot.data()["backdrop_path"],
    poster = snapshot.data()["poster_path"],
    overview = snapshot.data()["overview"],
    rating = snapshot.data()["vote_average"].toDouble();

}