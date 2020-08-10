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
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
            children: <Widget>[
              
            ],
          ),
        ],
      );
    }
  }



}
