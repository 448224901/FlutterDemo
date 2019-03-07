import 'package:flutter/material.dart';

class TabGirlPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GirlsAppPage(),
    );
  }
}

class GirlsAppPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    _GirlsAppPageState view = new _GirlsAppPageState();
    return view;
  }
}

class _GirlsAppPageState extends State<GirlsAppPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('美女');
  }
}