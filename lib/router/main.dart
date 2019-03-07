import 'package:flutter/material.dart';
import 'package:flutter_app/router/home.dart';
import 'package:flutter_app/router/mall.dart';
import 'package:flutter_app/router/mine.dart';
import 'package:flutter_app/router/msg.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{},
      home: MainPageWidget(),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '商铺', '消息', '我的'];

  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabImage(path) {
    return Image.asset(
      path,
      width: 20.0,
      height: 20.0,
    );
  }

  /*
   * 根据索引获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff63ca6c)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(color: const Color(0xff888888)));
    }
  }

  /*
   * 存储的四个页面，和Fragment一样
   */
  var _bodys;

  void initData() {
    /*
      bottom的按压图片
     */
    tabImages = [
      [
        Image.asset(
          'images/ic_nav_my_normal.png',
          width: 20.0,
          height: 20.0,
        ),
        Image.asset(
          'images/ic_nav_my_normal.png',
          width: 20.0,
          height: 20.0,
        ),
      ],
      [
        Image.asset(
          'images/ic_nav_my_normal.png',
          width: 20.0,
          height: 20.0,
        ),
        Image.asset(
          'images/ic_nav_my_normal.png',
          width: 20.0,
          height: 20.0,
        ),
      ],
      [
        Image.asset(
          'images/ic_nav_my_normal.png',
          width: 20.0,
          height: 20.0,
        ),
        Image.asset(
          'images/ic_nav_my_normal.png',
          width: 20.0,
          height: 20.0,
        ),
      ],
      [
        Image.asset(
          'images/ic_nav_my_normal.png',
          width: 20.0,
          height: 20.0,
        ),
        Image.asset(
          'images/ic_nav_my_normal.png',
          width: 20.0,
          height: 20.0,
        ),
      ],
    ];

    _bodys = [
      new HomePage(),
      new ShopPage(),
      new MsgPage(context),
      new MinePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body: _bodys[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
          BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
        ],
        //设置显示的模式
        type: BottomNavigationBarType.fixed,
        //设置当前的索引
        currentIndex: _tabIndex,
        //tabBottom的点击监听
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
