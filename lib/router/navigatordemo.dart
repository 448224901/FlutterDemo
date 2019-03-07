import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static const String routeName = '/router/FirstScreen';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstScreen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //进入下个页面
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          child: Text("launch new screen"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //关闭当前页面返回上个页面
            Navigator.pop(context);
          },
          child: Text("go back"),
        ),
      ),
    );
  }
}
