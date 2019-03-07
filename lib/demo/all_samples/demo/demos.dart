import 'package:flutter/material.dart';
import 'package:flutter_app/demo/all_samples/demo/layout01.dart';
import 'package:flutter_app/demo/all_samples/dio/diodemo.dart';
import 'package:flutter_app/demo/io.dart';
import 'package:flutter_app/plugin/ImagePicker.dart';
import 'package:flutter_app/plugin/ImagePickerTwo.dart';
import 'package:flutter_app/plugin/VideoPlayer.dart';
import 'package:flutter_app/plugin/VideoPlayerTwo.dart';
import 'package:flutter_app/plugin/carousel_slider.dart';
import 'package:flutter_app/plugin/chewie.dart';
import 'package:flutter_app/plugin/zoomableImagedemo.dart';

class DemosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('例子'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Layout01()));
            },
            child: Text('layout01'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DioDemoWidget()));
            },
            child: Text('dio网络请求库'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ReadAndWriteDemo()));
            },
            child: Text('读写文件'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ImagePickWidget()));
            },
            child: Text('选择图片'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => VideoPlayWidget()));
            },
            child: Text('视频播放'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => VideoPlayerTwoWidget()));
            },
            child: Text('视频播放2'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CheWieWidget()));
            },
            child: Text('UI视频播放'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ImagePickerTwoWidget()));
            },
            child: Text('图片视频案例'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ZoomableImageWidget()));
            },
            child: Text('图片查看和缩放'),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CarouselDemo()));
            },
            child: Text('轮播图'),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
