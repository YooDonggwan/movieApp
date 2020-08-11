import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieApp/bloc/get_search_result_bloc.dart';
import 'package:movieApp/model/search_result.dart';
import 'package:movieApp/model/search_result_response.dart';
import 'package:movieApp/style/theme.dart' as Style;

class MovieSearchDelegate extends SearchDelegate<SearchResult> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appbar
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResultBloc..getSearchResult(query);
    // show some result based on the selection
    return StreamBuilder<SearchResultResponse>(
        stream: searchResultBloc.subject.stream,
        builder: (context, AsyncSnapshot<SearchResultResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildSearchResultWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    return Column();
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget _buildSearchResultWidget(SearchResultResponse data) {
    List<SearchResult> searchResult = data.searchResult;

    if (searchResult == null) {
      return Container(
        child: Text("검색 결과가 없습니다."),
      );
    } else {
      return ListView(
        children: <Widget>[
          Text(
            "검색 결과", 
            style: TextStyle(
              color: Style.Colors.titleColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: searchResult.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {  
              return ListView(
                children: <Widget>[
                  searchResult[index].poster == null
                    ? Container(
                        width: 120.0,
                        height: 180.0,
                        decoration: BoxDecoration(
                          color: Style.Colors.secondColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(2.0)),
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              EvaIcons.filmOutline,
                              color: Colors.white,
                              size: 50.0,
                            )
                          ],
                        ),
                      )
                    : Container(
                        width: 120.0,
                        height: 180.0,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(2.0)),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w200/" +
                                    searchResult[index].poster),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 100.0,
                  child: Text(
                    searchResult[index].title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.0,
                    ),
                  ),
                ),
                ],
              );
            }, 
          ),
        ],
      );
    }
  }

  // List<int>.generate(searchResult.length, (i) => i + 1).map((index)
  List<int> generateNumbers(int length) {
    return List<int>.generate(length, (index) => index + 1);
  }
}
