import './movie.dart';
import './movie_detail.dart';

class MovieDetailResponse {
  final List<MovieDetail> movieDetails;
  final String error;

  MovieDetailResponse(this.movieDetails, this.error);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
    : movieDetails = 
          (json["results"] as List).map((i) => new MovieDetail.fromJson(i)).toList(),
          error = "";

  MovieDetailResponse.withError(String errorValue)
    : movieDetails = List(),
    error = errorValue;
}