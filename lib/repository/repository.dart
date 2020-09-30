import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:movieApp/model/cast.dart';
import 'package:movieApp/model/cast_response.dart';
import 'package:movieApp/model/movie.dart';
import 'package:movieApp/model/movie_detail_response.dart';
import 'package:movieApp/model/movie_response.dart';
import 'package:movieApp/model/genre_response.dart';
import 'package:movieApp/model/person_response.dart';
import 'package:movieApp/model/produc_country_response.dart';
import 'package:movieApp/model/search_result_response.dart';
import 'package:movieApp/model/teaser_response.dart';

class MovieRepository {
  
  ///////////// TMDB API ///////////////////////
  final String apiKey = "069b7dd19fcd41e43c5fa72e49ded1f5";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenreUrl = '$mainUrl/genre/movie/list';
  var getPersonUrl = '$mainUrl/trending/person/week';
  var movieUrl = '$mainUrl/movie';
  var getSearchUrl = '$mainUrl/search/movie';

  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
      "region": "KR",
      "page": 1
    };
    try {
      Response response  = await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
      "region": "KR",
      "page": 1
    };
    try {
      Response response  = await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
      "region": "KR",
      "page": 1
    };
    try {
      Response response  = await _dio.get(getGenreUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GenreResponse.withError("$error");
    }
  }

  Future<PersonResponse> getPerson() async {
    var params = {
      "api_key": apiKey
    };
    try {
      Response response  = await _dio.get(getPersonUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
      "region": "KR",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response  = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getDetailsBySearch(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
    };
    try {
      Response response  = await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
    };
    try {
      Response response  = await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<ProductionCountryResponse> getCountries(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
    };
    try {
      Response response  = await _dio.get(movieUrl + "/$id", queryParameters: params);
      return ProductionCountryResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductionCountryResponse.withError("$error");
    }
  }

  Future<CastResponse> getCast(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
    };
    try {
      Response response  = await _dio.get(movieUrl + "/$id" + "/credits", queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
    };
    try {
      Response response  = await _dio.get(movieUrl + "/$id" + "/similar", queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<TeaserResponse> getTeasers(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
    };
    try {
      Response response  = await _dio.get(movieUrl + "/$id" + "/videos", queryParameters: params);
      return TeaserResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TeaserResponse.withError("$error");
    }
  }

  Future<SearchResultResponse> getSearchResult(String query) async {
    var params = {
      "api_key": apiKey,
      "language": "ko-KR",
      "page": 1,
      "query": query,
      "region": "KR",
    };
    try {
      Response response  = await _dio.get(getSearchUrl, queryParameters: params);
      return SearchResultResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SearchResultResponse.withError("$error");
    }
  }

  /////////////// Cloud Firestore 
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<void> uploadSeenMovie(Movie seenMovie) async {
    return await _firestore
        .collection("seen_movie")
        .doc(seenMovie.title)
        .set({
          'id':seenMovie.id,
          'popularity':seenMovie.popularity,
          'title':seenMovie.title,
          'backdrop_path':seenMovie.backPoster,
          'poster_path':seenMovie.poster,
          'overview':seenMovie.overview,
          'vote_average':seenMovie.rating
        });
  }

  Future<MovieResponse> getSeenMovieList() async{
    List<DocumentSnapshot> doclist;
    try{
      // await _firestore
      //   .collection("seen_movie")
      //   .get()
      //   .then((snapshot) {
      //     // snapshot은 QuerySnapshot 이므로 documentSnapsnot으로 바꿔줘야함
      //     doclist = snapshot.docs;
      //   });
      // return MovieResponse.fromSnapshot(doclist);
      var documents = await _firestore.collection("SeenMovie").get();
      doclist = documents.docs;
      return MovieResponse.fromSnapshot(doclist);
    } catch (e) {
      print(e);
      return MovieResponse.withError("$e");
    }
  }

  Future<MovieResponse> getWishMovieList() async{
    List<DocumentSnapshot> doclist;
    try{
      var documents = await _firestore.collection("WishMovie").get();
      doclist = documents.docs;
      return MovieResponse.fromSnapshot(doclist);
    } catch (e) {
      print(e);
      return MovieResponse.withError("$e");
    }
  }

  Future<MovieResponse> getMasterpieceList() async{
    List<DocumentSnapshot> doclist;
    try{
      var documents = await _firestore.collection("Masterpiece").get();
      doclist = documents.docs;
      return MovieResponse.fromSnapshot(doclist);
    } catch (e) {
      print(e);
      return MovieResponse.withError("$e");
    }
  }

}