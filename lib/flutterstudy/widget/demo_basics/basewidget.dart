import 'package:flutter/material.dart';
import 'package:flutter_app/flutterstudy/widget/demo_basics/ContainerWidgetDemo.dart';

import 'RowWidgetDemo.dart';

class BaseWidget extends StatefulWidget {
  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础控件'),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContainerWidgetDemo()));
            },
            child: getItemView('Container'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RowWidgetDemo()));
            },
            child: getItemView('Row'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('Column'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('Image'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('Text'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('Icon'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('RaisedButton'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('Scaffold'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('AppBar'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('FlutterLogo'),
          ),
          GestureDetector(
            onTap: () {},
            child: getItemView('PlaceHolder'),
          ),
        ],
      ),
    );
  }

  Widget getItemView(var title) {
    var mTitle = title;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
//      color: Colors.blue,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Text(mTitle),
    );
  }
}
