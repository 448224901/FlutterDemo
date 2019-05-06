import 'package:flutter/material.dart';
import 'package:flutter_app/flutterstudy/widget/demo_basics/basewidget.dart';

class TabGirlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GirlsAppPage(),
    );
  }
}

class GirlsAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    _GirlsAppPageState view = new _GirlsAppPageState();
    return view;
  }
}

class _GirlsAppPageState extends State<GirlsAppPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BaseWidget()));
          },
          child: getItemView('基础控件'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('MD部件'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('IOS风格部件'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('布局'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('文本'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('资源，图片，图标'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('用户输入'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('动画和触摸'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('交互模式'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('样式'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('绘制和视觉效果'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('异步'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('滚动'),
        ),
        GestureDetector(
          onTap: () {},
          child: getItemView('辅助功能'),
        ),
      ],
    );
  }

  Widget getItemView(var title) {
    var mTitle = title;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
//      color: Colors.blue,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Text(mTitle),
    );
  }
}
