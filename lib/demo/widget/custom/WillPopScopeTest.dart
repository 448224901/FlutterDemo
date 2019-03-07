import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  _WillPopScopeTestRouteState createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Container(
      alignment: Alignment.center,
      child: Text('一秒内连续点击两次退出'),
    ), onWillPop: () async{
      if(_lastPressedAt==null||DateTime.now().difference(_lastPressedAt)>Duration(seconds: 1)){
        //两次点击间隔超过1秒则重新计时
        _lastPressedAt = DateTime.now();
        return false;
      }
      return true;
    });
  }
}
