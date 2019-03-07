import 'package:flutter/material.dart';
import 'package:flutter_app/demo/all_samples/demo/demos.dart';
import 'package:flutter_app/demo/all_samples/dialog/mian_dialog.dart';
import 'package:flutter_app/demo/all_samples/main_page.dart';
import 'package:flutter_app/demo/all_samples/pageview/GooglePageView.dart';
import 'package:flutter_app/demo/widget/ChipsDemo.dart';
import 'package:flutter_app/demo/widget/ContainerDemo.dart';
import 'package:flutter_app/demo/widget/PopMenuButtonDemo.dart';
import 'package:flutter_app/demo/widget/animation/animationdemo.dart';
import 'package:flutter_app/demo/widget/boxdemo.dart';
import 'package:flutter_app/demo/widget/centerDemo.dart';
import 'package:flutter_app/demo/widget/custom/customdemo.dart';
import 'package:flutter_app/demo/widget/futurebuilderwidget.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/materialdemo.dart';
import 'package:flutter_app/demo/widget/picker/PickerWidget.dart';
import 'package:flutter_app/demo/widget/platformdemo.dart';
import 'package:flutter_app/demo/widget/pulltorefresh/Example1.dart';
import 'package:flutter_app/demo/widget/pulltorefresh/flutterRefresh.dart';
import 'package:flutter_app/demo/widget/pulltorefresh/pulltorefresh.dart';
import 'package:flutter_app/demo/widget/slivers/sliversDemo.dart';
import 'package:flutter_app/demo/widget/stepperts.dart';
import 'package:flutter_app/demo/widget/stickyHeader/StickyHeaderWidget.dart';
import 'package:flutter_app/router/router2.dart';

class MyWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text('widgetDemo'),
      ),
      body: MyWidgetList(),
    );
  }
}

class MyWidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BoxDemo()));
          },
          color: Colors.blue,
          child: Text('box盒子模型'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CenterDemoWidget()));
          },
          color: Colors.blue,
          child: Text('基础控件'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChipsDemo()));
          },
          color: Colors.blue,
          child: Text('ChipsDemo'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContainerDemoWidget()));
          },
          color: Colors.blue,
          child: Text('ContainerDemoWidget'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PopMenuButtonDemo()));
          },
          color: Colors.blue,
          child: Text('PopMenuButtonDemo'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainActivity()));
          },
          color: Colors.blue,
          child: Text('samples'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          color: Colors.blue,
          child: Text('页面传值'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainDiaLogWidget()));
          },
          color: Colors.blue,
          child: Text('dialog'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DemosWidget()));
          },
          color: Colors.blue,
          child: Text('视频选择图片,dio网络请求,读写文件,轮播图'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StepperWidget()));
          },
          color: Colors.blue,
          child: Text('步骤指示器'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SliversWidget()));
          },
          color: Colors.blue,
          child: Text('嵌套滑动控件'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CustomDemos()));
          },
          color: Colors.blue,
          child: Text('自定义控件'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnimationDemoWidget()));
          },
          color: Colors.blue,
          child: Text('动画学习'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlatformWidget()));
          },
          color: Colors.blue,
          child: Text('获取平台电量'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FutureBuilderPage()));
          },
          color: Colors.blue,
          child: Text('根据返回结果显示不同布局的控件'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PullToRefreshWidget()));
          },
          color: Colors.blue,
          child: Text('下拉刷新上拉加载更多'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FlutterRefreshWidget()));
          },
          color: Colors.blue,
          child: Text('下拉刷新上拉加载更多02'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MaterialWidget()));
          },
          color: Colors.blue,
          child: Text('Material Widget'),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StickYHeaderWidget()));
          },
          color: Colors.blue,
          child: Text('粘性头部'),
        ),
        RaisedButton(
          onPressed: () {
            toPage(context, PickerWidget());
          },
          color: Colors.blue,
          child: Text('picker'),
        ),
        RaisedButton(
          onPressed: () {
            toPage(context, GooglePageView());
          },
          color: Colors.blue,
          child: Text('pageview'),
        )
      ],
    );
  }

  toPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
