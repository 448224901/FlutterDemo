import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/custom/CustoCircularProgressWidget.dart';
import 'package:flutter_app/demo/widget/custom/GradientButtonRoute.dart';
import 'package:flutter_app/demo/widget/custom/GradientCircularProgress.dart';
import 'package:flutter_app/demo/widget/custom/WillPopScopeTest.dart';
import 'package:flutter_app/demo/widget/custom/containerdemo.dart';
import 'package:flutter_app/demo/widget/custom/customButton.dart';
import 'package:flutter_app/demo/widget/custom/drawwidgetdemo.dart';
import 'package:flutter_app/demo/widget/custom/flexdemo.dart';
import 'package:flutter_app/demo/widget/custom/focustest.dart';
import 'package:flutter_app/demo/widget/custom/turnbox.dart';
import 'package:flutter_app/demo/widget/pointer/pointerdemo.dart';

class CustomDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义控件外观'),
      ),
      body: CustomList(),
    );
  }
}

class CustomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CustomButtonWidget()));
          },
          color: Colors.blue,
          child: Text('自定义按钮'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FocusTestWidget()));
          },
          color: Colors.blue,
          child: Text('输入框焦点案例'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FlexTestWidget()));
          },
          color: Colors.blue,
          child: Text('弹性布局'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContainerWidget()));
          },
          color: Colors.blue,
          child: Text('ContainerWidget'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WillPopScopeTestRoute()));
          },
          color: Colors.blue,
          child: Text('返回键的监听'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PointerDemoWidget()));
          },
          color: Colors.blue,
          child: Text('触摸事件案例'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GradientButtonRoute()));
          },
          color: Colors.blue,
          child: Text('组合方式自定义widget'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TurnBoxRoute()));
          },
          color: Colors.blue,
          child: Text('自定义旋转widget'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DrawWidgetDemo()));
          },
          color: Colors.blue,
          child: Text('自绘控件'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GradientCircularProgressRoute()));
          },
          color: Colors.blue,
          child: Text('圆形渐变进度条(自绘)'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>CustomCircularProgressWidget()));
          },
          color: Colors.blue,
          child: Text('自定义进度条'),
        )
      ],
    );
  }
}
