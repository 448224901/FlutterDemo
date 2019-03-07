import 'package:flutter/material.dart';

class ContainerDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: ListView(
        children: <Widget>[
          ContainerDemo(),
          OpacityDemo(),
          RowDemo(),

        ],
      ),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        //使子控件在其内部水平和垂直居中
        child: Stack(
      children: <Widget>[
        new Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          constraints: new BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
          ),
          width: 300.0,
          height: 200.0,
          decoration: buildBoxDecoration(),
          //控件会在子控件绘制之前或之后绘制一个装饰。
//            foregroundDecoration: buildBoxDecoration(),
          child: Image.asset('images/timg.jpg'),
          transform: new Matrix4.rotationZ(0.1),
        ),
        Image.asset(
          'images/timg.jpg',
          width: 200,
          height: 100,
        ),
      ],
    ));
  }

  // 注意：BoxDecoration返回的是Decoration对象
  Decoration buildBoxDecoration() {
    return new BoxDecoration(
      color: const Color(0xfffce5cd),
      //设置Border属性给容器添加边框
      border: new Border.all(
        //为边框添加颜色
        color: const Color(0xff6d9eeb),
        //边框宽度
        width: 8.0,
      ),
    );
  }
}

/// Opacity控件能调整子控件的不透明度，使子控件部分透明，
/// 不透明度的量从0.0到1.1之间，0.0表示完全透明，1.1表示完全不透明。
/// 即使子控件颜色带有透明度，例如：0xFF990D47A1，也会在这个颜色基础上再去设置透明度。
class OpacityDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Opacity(
      opacity: 0.5,
      child: new Container(
        width: 250.0,
        height: 100.0,
        decoration: new BoxDecoration(
          color: const Color(0xFF990D47A1),
        ),
      ),
    ));
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('水平垂直布局'),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print('点击红色按钮事件');
            },
            color: const Color(0xffcc0000),
            child: new Text('红色按钮'),
          ),
          new Flexible(
            flex: 1,
            child: new RaisedButton(
              onPressed: () {
                print('点击黄色按钮事件');
              },
              color: const Color(0xfff1c232),
              child: new Text('黄色按钮'),
            ),
          ),
          new RaisedButton(
            onPressed: () {
              print('点击粉色按钮事件');
            },
            color: const Color(0xffea9999),
            child: new Text('粉色按钮'),
          ),
//          new Expanded(
//            flex: 3,
//            child: new RaisedButton(
//              onPressed: () {
//                print('点击绿色按钮事件');
//                ShowToast('点击绿色按钮事件');
//              },
//              color: const Color(0xff00ff00),
//              child: new Text('绿色按钮'),
//            ),
//          ),
        ],
      ),
    );
  }
}

