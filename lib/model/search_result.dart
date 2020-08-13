class SearchResult {
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;

  SearchResult(
    this.id,
    this.popularity,
    this.title,
    this.backPoster,
    this.poster,
    this.overview,
  );

  SearchResult.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    popularity = json["popularity"],
    title = json["title"],
    backPoster = json["backdrop_path"],
    poster = json["poster_path"],
    overview = json["overview"];
}