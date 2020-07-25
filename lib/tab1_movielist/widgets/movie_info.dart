import 'package:flutter/material.dart';
import 'package:movieApp/bloc/get_movie_detail_bloc.dart';
import 'package:movieApp/model/movie.dart';


class MovieInfo extends StatefulWidget {
  final int id;
  MovieInfo({Key key, @required this.id}) : super(key: key);

  @override
  _MovieInfoState createState() => _MovieInfoState(id);
}



class _MovieInfoState extends State<MovieInfo> {
  final int id;
  _MovieInfoState(this.id);

  @override
  void initState() {
    super.initState();
    movieDetailBloc..getMovieDetail(id);
  }

  @override
  void dispose() {
    super.dispose();
    movieDetailBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}