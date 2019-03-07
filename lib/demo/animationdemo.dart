import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math';
import 'dart:ui' show lerpDouble;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  static const String routName = 'animationdemo';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

/**
 * TickerProviderStateMixin 动画需要实现
 */
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // Random([int seed ])：创建一个随机数生成器
  final random = new Random();
  int dataSet = 50;
  AnimationController animation;
  double startHeight;
  double currentHeight;
  double endHeight;

  /*
  @protected
  @mustCallSuper
  void initState()
  将此对象插入树中时调用
  该框架将为其创建的每个State对象精确地调用此方法一次
   */
  @override
  void initState() {
    super.initState();
    /*
    AnimationController({
      double value,
      Duration duration,
      String debugLabel,
      double lowerBound: 0.0,
      double upperBound: 1.0,
      TickerProvider vsync
    })
    创建动画控制器
     */
    animation = new AnimationController(
      // 这个动画应该持续的时间长短
        duration: const Duration(milliseconds: 300),
        vsync: this
    )
    /*
    void addListener(
      VoidCallback listener
    )
    每次动画值更改时调用监听器
    可以使用removeListener删除监听器
     */
      ..addListener((){
        setState((){
          /*
        double lerpDouble(
          num a,
          num b,
          double t
        )
        在两个数字之间进行线性内插
        return a + (b - a) * t;
         */
          currentHeight = lerpDouble(
              startHeight,
              endHeight,
              animation.value
          );
        });
      });
    startHeight = 0.0;
    currentHeight = 0.0;
    endHeight = dataSet.toDouble();
    // 开始向前运行这个动画（朝向最后）
    animation.forward();
  }

  /*
  @override
  void dispose()
  当该对象永久从树中删除时调用
  当该State对象永远不会再次构建时，该框架调用此方法
  框架调用dispose后，该State对象被视为已卸载，并且mounted属性为false，此时调用setState是一个错误
  生命周期的这个阶段是终点：没有办法重新安装dispose的State对象
   */
  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      startHeight = currentHeight;
      dataSet = random.nextInt(100);
      endHeight = dataSet.toDouble();
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new CustomPaint(
              size: new Size(200.0, 100.0),
              painter: new BarChartPainter(currentHeight)
          )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: changeData,
        child: new Icon(Icons.refresh),
      ),
    );
  }
}

// CustomPaint：是将绘画委托给CustomPainter策略的控件
class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

  BarChartPainter(this.barHeight);
  final double barHeight;

  /*
  void paint(
    Canvas canvas,
    Size size
  )
  当对象需要绘制时调用，它给出Canvas的坐标空间，使得原点位于框的左上角，
  框的面积是size参数的大小
   */
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Colors.blue[400]
      ..style = PaintingStyle.fill;
    // drawRect：使用给定的Paint绘制一个矩形，是否填充或描边（或两者）是由Paint.style控制
    canvas.drawRect(
      // Rect.fromLTWH(double left, double top, double width, double height)：
      // 从左上角和上边缘构造一个矩形，并设置其宽度和高度
        new Rect.fromLTWH(
            size.width-barWidth/2.0,
            size.height-barHeight,
            barWidth,
            barHeight
        ),
        paint
    );
  }

  /*
  bool shouldRepaint(
    CustomPainter,
    oldDelegate
  )
  当定制绘画委托类的新实例被提供给RenderCustomPaint对象时，
  或任何时候使用自定义绘画委托类的新实例创建新的CustomPaint对象
  （这相当于同一件事，因为后者是以前者实施）
   */
  @override
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}