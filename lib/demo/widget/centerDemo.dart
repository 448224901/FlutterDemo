import 'package:flutter/material.dart';

class CenterDemoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('基础控件'),
      ),
      body: ListView(
          children: <Widget>[
            CenterDemo(),
            AlignDemo(),
            PaddingDemo(),
            SizedBoxDemo(),
            AspectRatioDemo(),
          ],
      ),
    );
  }
}

// 居中对齐
class CenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Text('这是居中文字'),
      );
  }
}

/// Align控件即对齐控件，能将子控件所指定方式对齐，并根据子控件的大小调整自己的大小。
/// 九个方向：
/// topLeft 左上角        topCenter 顶部中心     topRight 右上角
/// bottomLeft 左下角     bottomCenter 底部中心  bottomRight 右下角
/// centerLeft 左边缘中心 center 水平垂直居中     centerRight 右边缘中心
class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: <Widget>[
          new Container(color: Colors.orange), //最底层的控件
          new Align(
            alignment: new FractionalOffset(0.0, 0.0),
            child: new Image.asset(
              'images/timg.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Align(
            alignment: FractionalOffset.topCenter,
            child: new Image.asset(
              'images/cover_img.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Align(
            alignment: FractionalOffset.topRight,
            child: new Image.asset(
              'images/timg.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Align(
            alignment: FractionalOffset.centerLeft,
            child: new Image.asset(
              'images/timg.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Align(
            alignment: FractionalOffset.center,
            child: new Image.asset(
              'images/timg.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Align(
            alignment: FractionalOffset.centerRight,
            child: new Image.asset(
              'images/timg.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Align(
            alignment: FractionalOffset.bottomLeft,
            child: new Image.asset(
              'images/timg.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Align(
            alignment: FractionalOffset.bottomCenter,
            child: new Image.asset(
              'images/timg.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Align(
            alignment: FractionalOffset.bottomRight,
            child: new Image.asset(
              'images/timg.jpg',
              width: 150.0,
              height: 150.0,
            ),
          ),
        ],
      );
  }
}

/// Padding填充控件
/// 注意：padding属性必须加上，否则会报错
/// 源码里面有 @required 注解的表示必须要加上的属性
class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.all(50.0), //设置padding值
//        child: new Image.asset(//使用图片填充
//          'images/demo.png',
//          width: 150.0,
//          height: 150.0,
//        ),
        child: new Container(
          //使用容器填充
          color: Colors.orange,
        ),
      );
  }
}

/// SizedBox控件能强制子控件具有特定宽度、高度或两者都有
/// 当SizedBox和其子控件都设置了宽高属性时，以SizedBox的宽高为准。
/// 下例中的实际宽高为250
class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.orange,
        child: new SizedBox(
          width: 250.0,
          height: 250.0,
          child: new Image.asset(
            'images/timg.jpg',
            width: 50.0,
            height: 50.0,
          ),
        ),
      );
  }
}

/// AspectRatio控件能强制子小部件的宽度和高度具有给定的宽高比，以宽度与高度的比例表示。
/// SizedBox 和 AspectRatio不能同时给子孩子控件使用。
/// 下例中的Image.asset的宽高属性是不起作用的
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.orange, //加一个外布局的背景色，看得清楚一些
        child: new AspectRatio(
          aspectRatio: 6.0 / 3.0,
          child: new Image.asset(
            //图片的宽高属性不起作用
            'images/timg.jpg',
            width: 50.0,
            height: 50.0,
          ),
        ),
      );
  }

}


class GoogleFadeInImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      fadeInCurve: Curves.easeIn,
      fadeOutCurve: Curves.easeOut,
      fadeInDuration: Duration(seconds: 2),
      fadeOutDuration: Duration(seconds: 2),
      placeholder: 'assets/images/wechat.jpg',
      image:
      'http://img3.redocn.com/tupian/20141202/xiaochaoyeshanjunmeishi_3491615.jpg',
    );
  }
}