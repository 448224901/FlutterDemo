import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///控件的显示和隐藏
class OffstageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('控件的显示和隐藏'),
      ),
      body: OffstageWidgetDemo(),
    );
  }
}

class OffstageWidgetDemo extends StatefulWidget {
  @override
  _OffstageWidgetDemoState createState() => _OffstageWidgetDemoState();
}

class _OffstageWidgetDemoState extends State<OffstageWidgetDemo> {
  var offstage = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Offstage(
          offstage: offstage,
          child: Container(color: Colors.blue, height: 100.0),
        ),
        new CupertinoButton(
          child: Text("点击切换显示"),
          onPressed: () {
            setState(() {
              offstage = !offstage;
            });
          },
        ),
      ],
    );
  }
}
