class SearchResult {
  final int id;
  final String poster;
  final String title;

  SearchResult(
    this.id,
    this.poster,
    this.title
  );

  SearchResult.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    poster = json["poster_path"],
    title = json["title"];

}