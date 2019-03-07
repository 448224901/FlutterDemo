import 'package:flutter/material.dart';

class TabIOSPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IOSAppPage(),
    );
  }
}

class IOSAppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    _IOSAppPageState view = new _IOSAppPageState();
    return view;
  }
}

class _IOSAppPageState extends State<IOSAppPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('IOS');
  }
}