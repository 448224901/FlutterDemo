import 'package:flutter/material.dart';
///FractionallySizedBox控件会根据现有空间，来调整child的尺寸，所以说child就算设置了具体的尺寸数值，也不起作用。

class FractionallySizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fractionallySizeBox'),
      ),
      body: new Container(
        color: Colors.blue,
        height: 150.0,
        width: 150.0,
        padding: const EdgeInsets.all(10.0),
        child: new FractionallySizedBox(
          alignment: Alignment.topLeft,
          widthFactor: 1.5,
          heightFactor: 0.5,
          child: new Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
