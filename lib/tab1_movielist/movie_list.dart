import 'package:flutter/material.dart';
import 'package:movieApp/tab1_movielist/widgets/genres.dart';
import 'package:movieApp/tab1_movielist/widgets/now_playing.dart';
import '../style/theme.dart' as Style;

// 모든 영화 리스트 제공해주어야함
// 관객순 / 개봉순 / 장르별
// 재정리가 되어야 하므로 stateful이 맞는듯

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Style.Colors.mainColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 8.0,),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "신작 영화",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 26.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.0,),
          NowPlaying(),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "장르별 영화",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          GenresScreen(),
        ],
      ),
    );
          
  }
}

// Widget MovieCard(String Title, String Rate, String imgPath) {
//   return InkWell(
//     onTap: () {},
//     child: Column(
//       children: <Widget>[
//         Card(
//           elevation: 0.0,
//           child: Image.asset(
//             imgPath,
//             fit: BoxFit.fill,
//             width: 130.0,
//             height: 160.0,
//           ),
//         ),
//         SizedBox(height: 12.0,),
//         Text(
//           Title,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 26.0,
//           ),
//         ),
//         Text(
//           Rate,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18.0,
//           ),
//         ),
//       ],
//     ),
//   );
// }
