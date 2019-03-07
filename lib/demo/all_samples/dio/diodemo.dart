import 'package:flutter/material.dart';
import 'package:flutter_app/demo/all_samples/dio/downloaddemo.dart';

class DioDemoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('dio网络请求库'),
      ),
      body: MyWidgetList(),
    );
  }
}

class MyWidgetList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DownLoadWidget()));
          },
          color: Colors.blue,
          child: Text('download'),
        ),
      ],
    );
  }
}

