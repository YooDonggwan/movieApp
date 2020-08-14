import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieApp/style/theme.dart' as Style;
import 'package:movieApp/tab2_mylist/widget/movie_feed.dart';

class SeenMovie extends StatefulWidget {
  @override
  _SeenMovieState createState() => _SeenMovieState();
}

class _SeenMovieState extends State<SeenMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'M o v i a r y',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27.0,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Style.Colors.mainColor,
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: searchResult.length,
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
                      builder: (context) => MovieDetailScreenBySearch(movie: searchResult[index])
                  ));
                },
                child: Column(
                  children: <Widget>[
                    searchResult[index].poster == null
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
                                          searchResult[index].poster),
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
                        searchResult[index].title,
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