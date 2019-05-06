import 'package:flutter/material.dart';

class ContainerWidgetDemo extends StatefulWidget {
  @override
  _ContainerWidgetDemoState createState() => _ContainerWidgetDemoState();
}

class _ContainerWidgetDemoState extends State<ContainerWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Container(
        alignment: Alignment.center, //设置对齐方式
        child: Text(
          'Container',
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
      ),
    );
  }
}
