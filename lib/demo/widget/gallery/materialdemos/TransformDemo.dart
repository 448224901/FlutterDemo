import 'package:flutter/material.dart';

///可以对child做平移、旋转、缩放等操作
class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('可以对child做平移、旋转、缩放等操作'),
      ),
      body: ListView(
        children: <Widget>[
          TransformWidgetOne(),
          TransformWidgetTwo(),
          TransformWidgetThree(),
          TransformWidgetFour(),
        ],
      ),
    );
  }
}

class TransformWidgetOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        transform: Matrix4.rotationZ(0.3),
        child: Container(
          margin: EdgeInsets.only(bottom: 100),
          color: Colors.blue,
          width: 100.0,
          height: 100.0,
        ),
      ),
    );
  }
}

class TransformWidgetTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: 0.5,
        child: Container(
          margin: EdgeInsets.only(bottom: 100),
          color: Colors.blue,
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}

class TransformWidgetThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(100, 0),//像右平移100
        child: Container(
          margin: EdgeInsets.only(bottom: 100),
          color: Colors.blue,
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}

  class TransformWidgetFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale:0.5,//缩放
        child: Container(
          margin: EdgeInsets.only(bottom: 100),
          color: Colors.blue,
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}