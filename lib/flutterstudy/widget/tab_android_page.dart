import 'package:flutter/material.dart';

class TabAndroidPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AndroidAppPage(),
    );
  }
}

class AndroidAppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    _AndroidAppPageState view = new _AndroidAppPageState();
    return view;
  }
}

class _AndroidAppPageState extends State<AndroidAppPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('android');
  }
}