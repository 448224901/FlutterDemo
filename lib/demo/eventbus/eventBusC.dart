import 'package:flutter/material.dart';
import 'package:flutter_app/demo/eventbus/EventBus.dart';

class EventBusC extends StatefulWidget {
  @override
  _EventBusCState createState() => _EventBusCState();
}

class _EventBusCState extends State<EventBusC> {
  var username = '';
  @override
  Widget build(BuildContext context) {
    bus.on("login", (arg){
      print('页面C登陆了:$arg');
      username = arg;
      setState(() {

      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('用户信息页!'),
      ),
      body: ListView(
        children: <Widget>[
          Text(username==""?"未登录":"$username信息展示"),
        ],
      ),
    );
  }
}
