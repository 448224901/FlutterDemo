import 'package:flutter/material.dart';
import 'EventBus.dart';
class EventBusB extends StatefulWidget {
  @override
  _EventBusBState createState() => _EventBusBState();
}

class _EventBusBState extends State<EventBusB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆事件!'),
      ),
      body: ListView(
        children: <Widget>[
          Text('登陆!'),
          RaisedButton(onPressed: (){
            bus.emit('login','张三');
            Navigator.of(context).pop();
          },child: Text('登陆'),)
        ],
      ),
    );
  }
}
