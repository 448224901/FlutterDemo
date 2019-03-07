import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/animation/animationOne.dart';
import 'package:flutter_app/demo/widget/animation/animationTwo.dart';
import 'package:flutter_app/demo/widget/animation/staggeranimation.dart';

class AnimationDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画学习'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimationOneWidget()));
            },
            child: Text('动画demo1'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimationDemoTwo()));
            },
            child: Text('动画demo2'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StaggerDemo()));
            },
            child: Text('交错动画'),
          ),
        ],
      ),
    );
  }
}
