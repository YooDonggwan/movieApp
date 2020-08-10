import 'package:movieApp/model/search_result.dart';

class SearchResultResponse {
  final List<SearchResult> searchResult;
  final String error;

  SearchResultResponse(this.searchResult, this.error);

  SearchResultResponse.fromJson(Map<String, dynamic> json)
    : searchResult = (json["results"] as List).map((i) => new SearchResult.fromJson(i)).toList(),
      error = "";

  SearchResultResponse.withError(String errorValue)
    : searchResult = List(),
      error = errorValue;
}