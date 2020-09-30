import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieApp/bloc/get_firestore_seenMovies_bloc.dart';
import 'package:movieApp/bloc/get_firestore_wishMovie_bloc.dart';
import 'package:movieApp/model/movie.dart';
import 'package:movieApp/model/movie_response.dart';
import 'package:movieApp/style/theme.dart' as Style;
import 'package:movieApp/tab1_movielist/screen/detail_screen.dart';

class WishMovieScreen extends StatefulWidget {
  WishMovieScreen({Key key}) : super(key : key);
  @override
  _WishMovieScreenState createState() => _WishMovieScreenState();
}

class _WishMovieScreenState extends State<WishMovieScreen> {

  @override
  void initState() {
    super.initState();
    firestoreWishMovieBloc..getWishMovieList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: firestoreWishMovieBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildWishMovieScreenWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      });
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

  Widget _buildWishMovieScreenWidget(MovieResponse data) {
    List<Movie> wishMovieList = data.firestoreMovie;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          '보고싶은 영화',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Style.Colors.mainColor,
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: wishMovieList.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (MediaQuery.of(context).size.width / 1.5) / (MediaQuery.of(context).size.height / 2),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(movie: wishMovieList[index])
                  ));
                },
                child: Column(
                  children: <Widget>[
                    wishMovieList[index].poster == null
                        ? Expanded(
                            child: Container(
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
                            ),
                          )
                        : Expanded(
                            child: Container(
                              width: 170,
                              height: 160.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w200/" +
                                          wishMovieList[index].poster),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      width: 160,
                      child: Text(
                        wishMovieList[index].title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}