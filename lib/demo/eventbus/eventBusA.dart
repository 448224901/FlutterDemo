import 'package:flutter/material.dart';
import 'package:flutter_app/demo/eventbus/eventBusB.dart';
import 'package:flutter_app/demo/eventbus/eventBusC.dart';
import 'EventBus.dart';

class EventBusA extends StatefulWidget {
  @override
  _EventBusAState createState() => _EventBusAState();
}

class _EventBusAState extends State<EventBusA> {
  var username = '';

  @override
  Widget build(BuildContext context) {
    bus.on("login", (arg){
      print('页面Ｂ登陆了:$arg');
      username = arg;
      setState(() {

      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("全局事件总线"),
      ),
      body: ListView(
          children: <Widget>[
            Text(username==""?"未登录":username),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EventBusB()));
            },child: Text('登陆页面'),),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EventBusC()));
            },child: Text('用户详情页面'),)
          ],
      ),
    );
  }
}
