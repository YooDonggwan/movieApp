import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TeaserPlayerScreen extends StatefulWidget {
  final YoutubePlayerController controller;
  TeaserPlayerScreen({Key key, @required this.controller}) : super(key: key);
  @override
  _TeaserPlayerScreenState createState() =>
      _TeaserPlayerScreenState(controller);
}

class _TeaserPlayerScreenState extends State<TeaserPlayerScreen> {
  final YoutubePlayerController controller;
  _TeaserPlayerScreenState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Center(
            child: YoutubePlayer(
              controller: controller,
            ),
          ),
          Positioned(
            top: 40.0,
            right: 20.0,
            child: IconButton(
              icon: Icon(EvaIcons.closeCircle),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
