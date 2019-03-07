import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CheWieWidget extends StatefulWidget {
  @override
  _CheWieState createState() => _CheWieState();
}

class _CheWieState extends State<CheWieWidget> {
  final playerWidget = new Chewie(
    new VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4'),
    aspectRatio: 3 / 2,
    autoPlay: true,
    looping: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ui视频播放'),
      ),
      body: playerWidget,
    );
  }
}
