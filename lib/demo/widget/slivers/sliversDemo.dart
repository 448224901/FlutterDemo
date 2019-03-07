import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/slivers/SingleChildScrollViewDemo.dart';
import 'package:flutter_app/demo/widget/slivers/sliverAppBarDemo.dart';

class SliversWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑动布局案例'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExpandedAppBarPage()));
            },
            color: Colors.blue,
            child: Text('SliverAppBar'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SingleChildScrollViewWidget()));
            },
            color: Colors.blue,
            child: Text('SingleChildScroll'),
          ),
        ],
      ),
    );
  }
}
