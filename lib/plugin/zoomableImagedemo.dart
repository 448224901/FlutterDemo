import 'package:flutter/material.dart';
import 'package:zoomable_image/zoomable_image.dart';

///图片查看和手势缩放功能
class ZoomableImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图像查看和手势缩放功能'),
      ),
      body: ZoomableImage(AssetImage('images/timg.jpg'),maxScale: 8,),
    );
  }
}
