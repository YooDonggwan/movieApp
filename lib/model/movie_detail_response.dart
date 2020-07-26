import './movie_detail.dart';

class MovieDetailResponse {
  final MovieDetail movieDetails;
  final String error;

  MovieDetailResponse(this.movieDetails, this.error);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
    : movieDetails = MovieDetail.fromJson(json),
      error = "";

  MovieDetailResponse.withError(String errorValue)
    : movieDetails = MovieDetail(null, null, null, null, null, null, null, null),
      error = errorValue;
}