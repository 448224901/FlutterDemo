import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/pointer/pointerTs1.dart';

class PointerDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('事件处理')),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PointerTsOneWidget()));
            },
            child: Text("事件案例"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PointerTsTwoWidget()));
            },
            child: Text("事件案例2"),
          ),
        ],
      ),
    );
  }
}
