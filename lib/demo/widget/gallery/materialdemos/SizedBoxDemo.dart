import 'package:flutter/material.dart';
///比较常用的一个控件，设置具体尺寸。
///width：宽度值，如果具体设置了，则强制child宽度为此值，如果没设置，则根据child宽度调整自身宽度。
///height：同上。
class SizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedBox'),
      ),
      body: Container(
        color: Colors.green,
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: 200.0,
          height: 200.0,
          child: Container(
            color: Colors.red,
            width: 100.0,
            height: 300.0,
          ),
        ),
      ),
    );
  }
}
