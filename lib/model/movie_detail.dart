import 'package:movieApp/model/genre.dart';
import 'package:movieApp/model/produc_country.dart';

class MovieDetail {
  final int id;
  final bool adult;
  final String poster;
  final List<Genre> genres;
  final String overview;
  final int runtime;
  final String releaseDate;
  final List<ProductionCountry> originCountry;

  MovieDetail(
    this.id,
    this.adult,
    this.poster,
    this.genres,
    this.overview,
    this.runtime,
    this.releaseDate,
    this.originCountry
  );

  MovieDetail.fromJson(Map<String, dynamic> json)
        : id = json["id"],
          adult = json["adult"],
          poster = json["poster_path"],
          genres = (json["genres"] as List).map((i) => new Genre.fromJson(i)).toList(),
          overview = json["overview"],
          runtime = json["runtime"],
          releaseDate = json["release_date"],
          originCountry = (json["production_countries"] as List).map((i) => new ProductionCountry.fromJson(i)).toList();

}