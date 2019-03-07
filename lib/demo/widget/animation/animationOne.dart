import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("images/cover_img.jpg",
          width: animation.value, height: animation.value),
    );
  }
}

class AnimationOneWidget extends StatefulWidget {
  @override
  _AnimationOneWidgetState createState() => _AnimationOneWidgetState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _AnimationOneWidgetState extends State<AnimationOneWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    //上面的例子中并没有指定Curve，所以放大的过程是线性的（匀速），下面我们指定一个Curve，来实现一个类似于弹簧效果的动画过程
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画01'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'images/timg.jpg',
            width: animation.value,
            height: animation.value,
          ),
          AnimatedImage(
            animation: animation,
          ),
          ScaleTransition(
            scale: controller,
            child: Image.asset('images/timg.jpg'),
          ),
          FadeTransition(
            opacity: controller,
            child: Image.asset('images/timg.jpg'),
          ),
          FractionalTranslation(
            translation: Offset(5,5),
            child: Image.asset('images/timg.jpg'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //路由销毁时需要释放动画
    controller.dispose();
    super.dispose();
  }
}
