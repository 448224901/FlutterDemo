import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/flutterstudy/widget/drawer_page.dart';
import 'package:flutter_app/flutterstudy/widget/tab_android_page.dart';
import 'package:flutter_app/flutterstudy/widget/tab_girl_page.dart';
import 'package:flutter_app/flutterstudy/widget/tab_ios_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{//用于使用到了一点点的动画效果，因此加入了SingleTickerProviderStateMixin
  var _curIndex = 0;
  var _body;

  _initPage(){
    _body = IndexedStack(
      children: <Widget>[
        TabGirlPage(),
        TabAndroidPage(),
        TabIOSPage(),
      ],
      index: _curIndex,
    );
  }

  _showDialog() {
    showDialog(context: context,
      child: AlertDialog(
        content: Text('退出app'),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.pop(context);
            SystemNavigator.pop();//关闭app
          }, child: Text('确定'))
        ],
      ));
  }

  Future<bool> _requestPop() {
    _showDialog();
    return new Future.value(false);
  }

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _initPage();
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          //WillPopScope监听返回按钮
          appBar: AppBar(
            title: Text('Flutter 学习'),
            centerTitle: true,
          ), //头部的标题AppBar
          drawer: Drawer(
            child: DrawerPage(),
          ), //侧滑菜单
          bottomNavigationBar: new BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),
              title: Text('妹子')),
              BottomNavigationBarItem(icon: Icon(Icons.phone_android),title: Text('Android')),
              BottomNavigationBarItem(icon: Icon(Icons.phone_iphone),title: Text('IOS')),
            ],
            currentIndex: _curIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _curIndex = index;
              });
            },
          ), //底部导航
          body: _body,
        ),
        onWillPop: _requestPop); //当前页面退出
  }
}
