import 'package:flutter/material.dart';
import 'dart:math';

class CustomCircularProgressWidget extends StatefulWidget {
  @override
  _CustomCircularProgressWidgetState createState() =>
      _CustomCircularProgressWidgetState();
}

class _CustomCircularProgressWidgetState
    extends State<CustomCircularProgressWidget> {
  GestureDragDownCallback _panDown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('自定义控件'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onPanDown: (details) {},
                child: CustomPaint(
                  size: Size(300, 300),
                  painter: CircularProgressPaint(),
                ),
              ),
              CustomPaint(
                size: Size(double.infinity, 500),
                painter: CustomWidgetPaint(),
              ),
            ],
          ),
        ));
  }
}

class CircularProgressPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = min(size.width / 2, size.height / 2);
    final Offset _offsetCenter = Offset(center, center);
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke //不充满
      ..color = Colors.red
      ..strokeWidth = 20
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 22); //毛玻璃
    canvas.drawCircle(_offsetCenter, center - 50,
        ringPaint); //其中c为圆心坐标点，这个offset偏移值是以画布原点（左上角）为坐标轴中心点来计算的，很明显大小为offsetCenter = Offset(center, center)
    var path = Path()
      ..addOval(Rect.fromCircle(center: _offsetCenter, radius: center - 40))
      ..addOval(Rect.fromCircle(center: _offsetCenter, radius: center - 60));
    canvas.drawShadow(path, Colors.grey, 4, true);
    final progressPaint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.blue
      ..strokeWidth = 20;
    final progressPaint2 = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.yellow
      ..strokeWidth = 20;
    num argMath(num arg) => arg / (180 / pi);
    var rect = new Rect.fromCircle(center: _offsetCenter, radius: center - 10);
    canvas.drawArc(rect, argMath(0), argMath(160), false, progressPaint);
    canvas.drawArc(rect, argMath(160), argMath(270), false, progressPaint2);
    canvas.drawArc(rect, argMath(160), argMath(2), false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }

  void progressChanged(double value) {
    print('value:$value');
  }
}

class CustomWidgetPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = min(size.width / 2, size.height / 2);
    final ringPaint = Paint()
      ..style = PaintingStyle.fill //充满
      ..color = Colors.red
      ..strokeWidth = 2;
    canvas.drawCircle(Offset(center, center), 50, ringPaint);
    var path = Path()
      ..addOval(Rect.fromCircle(center: Offset(center, center), radius: 54));
    canvas.drawShadow(path, Colors.grey, 4.0, true);
    var path2 = Path();
    var rect = Rect.fromLTRB(50, 50, 240, 200);
    //贝塞尔曲线，path.moveTo不写就是从0,0开始
    path2.moveTo(150, 300);
    path2.quadraticBezierTo(200, 200, 250, 300);
    path2.quadraticBezierTo(300, 400, 350, 300);
    final paint2 = Paint()
      ..style = PaintingStyle.stroke //充满
      ..color = Colors.indigoAccent
      ..strokeWidth = 2;
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }
}
