import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/animation.dart';
import 'bar.dart';

class AnimationHome02 extends StatelessWidget {
  static const String routName = 'AnimationHome02';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimationHome02',
      home: Animation02(),
    );
  }
}

class Animation02 extends StatefulWidget {
  @override
  _Animation02State createState() => _Animation02State();
}

class _Animation02State extends State<Animation02>
    with TickerProviderStateMixin {
  final random = Random();
  AnimationController animation;
  BarTween tween;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    // Tween({T begin, T end })：创建tween（补间）
    tween = BarTween(Bar(0.0),Bar(50.0));
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeDate() {
    setState(() {
      tween = BarTween(
        /*
        @override
        T evaluate(
          Animation<double> animation
        )
        返回给定动画的当前值的内插值
        当动画值分别为0.0或1.0时，此方法返回begin和end
         */
        tween.evaluate(animation),
        new  Bar(100.0 * random.nextDouble()),);
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(200.0, 100.0),
          /*
            Animation<T> animate(
              Animation<double> parent
            )
            返回一个由给定动画驱动的新动画，但它承担由该对象确定的值
             */
          painter: BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: changeDate,child: Icon(Icons.refresh),),
    );
  }
}

