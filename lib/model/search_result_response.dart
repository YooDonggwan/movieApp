import 'package:movieApp/model/search_result.dart';

class SearchResultResponse {
  final SearchResult searchResult;
  final String error;

  SearchResultResponse(this.searchResult, this.error);

  SearchResultResponse.fromJson(Map<String, dynamic> json)
    : searchResult = SearchResult.fromJson(json),
      error = "";

  SearchResultResponse.withError(String errorValue)
    : searchResult = SearchResult(null, null, null),
      error = errorValue;
}