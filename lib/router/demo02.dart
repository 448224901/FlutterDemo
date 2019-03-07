import 'package:flutter/material.dart';

class Demo02 extends StatelessWidget {
  static const routName = 'demo02/';
  var data;

  Demo02(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('传过来的数据:$data'),
      ),
    );
  }
}
