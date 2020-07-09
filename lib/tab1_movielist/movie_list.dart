import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blueGrey[800],
      body: Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 40.0,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "전체",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "액션",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "판타지/SF",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "공포/호러",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "만화/애니",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "새로 나온 인기 영화",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 26.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                // Container(
                //   width: double.infinity,
                //   height: 230.0,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: <Widget>[
                //       // 여기에 이미지 들어가면 됨
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget MovieCard(String Title, String Rate, String imgPath) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: <Widget>[
        Card(
          elevation: 0.0,
          child: Image.asset(
            imgPath,
            fit: BoxFit.fill,
            width: 130.0,
            height: 160.0,
          ),
        ),
        SizedBox(height: 12.0,),
        Text(
          Title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        Text(
          Rate,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}
