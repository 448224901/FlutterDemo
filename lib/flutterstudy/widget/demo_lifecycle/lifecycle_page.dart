import 'package:flutter/material.dart';

class LifecycleAppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LifecycleAppPageState();
  }
}

class _LifecycleAppPageState extends State<LifecycleAppPage> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: new AppBar(
        title: Text('lifecycle学习'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Image.asset('images/lifecycle.png'),
          Text('查看日志打印的状态'),
        ],
      ),
    );
  }
}

class LifecyclePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: LifecycleAppPage(),
    );
  }
}