import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:movieApp/bloc/get_movie_teasers_bloc.dart';
import 'package:movieApp/model/movie.dart';
import 'package:movieApp/tab1_movielist/screen/make_note_screen.dart';
import 'package:movieApp/tab1_movielist/widgets/casts.dart';
import 'package:movieApp/model/teaser.dart';
import 'package:movieApp/model/teaser_response.dart';
import 'package:movieApp/style/theme.dart' as Style;
import 'package:movieApp/tab1_movielist/screen/teaser_player.dart';
import 'package:movieApp/tab1_movielist/widgets/casts.dart';
import 'package:movieApp/tab1_movielist/widgets/movie_info.dart';
import 'package:movieApp/tab1_movielist/widgets/similar_movies.dart';
import 'package:movieApp/tab2_mylist/screen/seen_movie_screen.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  MovieDetailScreen({Key key, @required this.movie}) : super(key: key);
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState(movie);
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final Movie movie;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _MovieDetailScreenState(this.movie);

  @override
  void initState() {
    super.initState();
    teasersBloc..getTeasers(movie.id);
  }

  @override
  void dispose() {
    super.dispose();
    teasersBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "이미 본 영화 추가",
      currentButton: FloatingActionButton(
        heroTag: "본 영화",
        backgroundColor: Colors.redAccent,
        mini: true,
        child: Icon(Icons.movie_creation),
        onPressed: () {
          firestore.collection('SeenMovie')
            .doc(movie.title)
            .set({
              'id' : movie.id,
              'popularity': movie.popularity,
              'title': movie.title,
              'backdrop_path': movie.backPoster,
              'poster_path': movie.poster,
              'overview': movie.overview,
              'vote_average': movie.rating
            });
        },
      ),
    ));

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "보고싶은 영화 추가",
      currentButton: FloatingActionButton(
        heroTag: "볼 영화",
        backgroundColor: Colors.greenAccent,
        mini: true,
        child: Icon(Icons.movie_filter),
        onPressed: () {
          firestore.collection('WishMovie')
            .doc(movie.title)
            .set({
              'id' : movie.id,
              'popularity': movie.popularity,
              'title': movie.title,
              'backdrop_path': movie.backPoster,
              'poster_path': movie.poster,
              'overview': movie.overview,
              'vote_average': movie.rating
            });
        },
      ),
    ));

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "명작 보관함 추가",
      currentButton: FloatingActionButton(
        heroTag: "명작",
        backgroundColor: Colors.blueAccent,
        mini: true,
        child: Icon(Icons.local_movies),
        onPressed: () {
          firestore.collection('Masterpiece')
            .doc(movie.title)
            .set({
              'id' : movie.id,
              'popularity': movie.popularity,
              'title': movie.title,
              'backdrop_path': movie.backPoster,
              'poster_path': movie.poster,
              'overview': movie.overview,
              'vote_average': movie.rating
            });
        },
      ),
    ));

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "영화노트 추가",
      currentButton: FloatingActionButton(
        heroTag: "영화노트",
        backgroundColor: Colors.blueAccent,
        mini: true,
        child: Icon(Icons.note),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MakeNoteScreen(movie: movie)
          ));
        },
      ),
    ));

    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      floatingActionButton: UnicornDialer(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
        parentButtonBackground: Colors.redAccent,
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.add),
        childButtons: childButtons),
      body: Builder(
        builder: (context) {
          return SliverFab(
            floatingPosition: FloatingPosition(right: 20.0),
            floatingWidget: StreamBuilder<TeaserResponse>(
              stream: teasersBloc.subject.stream,
              builder: (context, AsyncSnapshot<TeaserResponse> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.error != null &&
                      snapshot.data.error.length > 0) {
                    return _buildErrorWidget(snapshot.data.error);
                  }
                  return _buildTeaserWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error);
                } else {
                  return _buildLoadingWidget();
                }
              },
            ),
            expandedHeight: 200.0,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Style.Colors.mainColor,
                expandedHeight: 200.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    movie.title.length > 40
                        ? movie.title.substring(0, 37) + "..."
                        : movie.title,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original" +
                                    movie.backPoster),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.0)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.0)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            movie.rating.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          RatingBar(
                            itemSize: 10.0,
                            initialRating: movie.rating / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              EvaIcons.star,
                              color: Style.Colors.secondColor,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 20.0,),
                      child: Text(
                        "영화 줄거리",
                        style: TextStyle(
                          color: Style.Colors.titleColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        movie.overview,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          height: 1.5
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    MovieInfo(id: movie.id),
                    Casts(id: movie.id),
                    SimilarMovies(id: movie.id),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Container();
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('$error'),
        ],
      ),
    );
  }

  Widget _buildTeaserWidget(TeaserResponse data) {
    List<Teaser> teaser = data.teaser;
    return FloatingActionButton(
      backgroundColor: Style.Colors.secondColor,
      child: Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => TeaserPlayerScreen(
              controller: YoutubePlayerController(
              initialVideoId: teaser[0].key,
              flags: YoutubePlayerFlags(
                autoPlay: true,
              ),
              ),
            ),
          ),
        );
      }
    );
  }

}
