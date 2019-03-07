import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogoAppState();
  }
}

//SingleTickerProviderStateMixin 添加动画的参数
class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  bool forward = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(microseconds: 2000));
    animation = new Tween(begin: 0.0,end: 100.0).animate(controller)
//    ..addListener()，这种语法意味着使用animate()的返回值来调用addListener()方法。考虑下面的例子：
    ..addListener((){
      setState(() {
        print(animation.value);
      });
    })
    ..addStatusListener((state){
      print('$state');
//      if(state==AnimationStatus.completed){
//        controller.reverse();
//      }else{
//        controller.forward();
//      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child:  FlutterLogo(size: animation.value,),
          ),
          AnimatedLogo(animation: animation,),
          RaisedButton(onPressed: (){
            if(forward){
              controller.forward();//向前播放动画
            }else{
              controller.reverse();//向后播放动画
            }
            forward = !forward;
          },
            child: Text('开始动画'),),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

//AnimatedWidget类允许您从setState()调用中的动画代码中分离出widget代码
class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo({Key key,Animation<double> animation}):
      super(key:key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;

    return Container(
      child: FlutterLogo(
        size: animation.value,
      ),
    );
  }
}