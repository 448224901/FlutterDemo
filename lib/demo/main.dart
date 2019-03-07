import 'package:flutter/material.dart';
import 'package:flutter_app/demo/add.dart';
import 'package:flutter_app/demo/animation/animatedListSample.dart';
import 'package:flutter_app/demo/animation/animationts.dart';
import 'package:flutter_app/demo/animation01.dart';
import 'package:flutter_app/demo/animation02.dart';
import 'package:flutter_app/demo/animationdemo.dart';
import 'package:flutter_app/demo/bottom_navigation_demo.dart';
import 'package:flutter_app/demo/eventbus/eventBusA.dart';
import 'package:flutter_app/demo/gestureDetector.dart';
import 'package:flutter_app/demo/hero/basic_hero_animation.dart';
import 'package:flutter_app/demo/list/ShoppingList.dart';
import 'package:flutter_app/demo/loadmore/loadmore.dart';
import 'package:flutter_app/demo/widget/widgetdemo.dart';
import 'package:flutter_app/flutterstudy/studymian.dart';
import 'package:flutter_app/flutterstudy/widget/demo_route/route_page_with_value.dart';
import 'package:flutter_app/im/imhome.dart';
import 'package:flutter_app/list/listdemo.dart';
import 'package:flutter_app/list/multipletypeslist.dart';
import 'package:flutter_app/im/sign_in.dart';
import 'package:flutter_app/router/navigatordemo.dart';
import 'package:flutter_app/router/router1.dart';
import 'package:flutter_app/router/router2.dart';
import 'package:flutter_app/websocket/websocketdemo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/**
 * 当代码框里输入 stl 的时候，可以自动弹出创建无状态控件的模板选项，而输入 stf 的时，就会弹出创建有状态 Widget 的模板选项。
 */

//main() {
////  runApp(new Center(
////      child: new Text(
////    '你好，世界',
////    textDirection: TextDirection.ltr,
////  )));
//}

/*
上面实例中只使用了runApp函数，runApp函数接受指定的控件(Widget)，并使其作为控件树(widget tree)的根控件。控件(Widget)定义一个元素(Element)的配置，在Flutter框架的层次结构中处于核心层。本实例中，控件树(widget tree)包含两个控件，Center控件使其子控件处于中间位置，Text控件打印文本内容。runApp函数强制将根控件覆盖屏幕，这意味着文本“你好，世界！”将显示在屏幕中心。

在写应用程序时，经常会使用StatelessWidget和StatefulWidget编写新控件,两者的差别在于你是否要管理控件的状态。一个控件的主要任务是实现build函数，定义控件中其他较低层次的控件。build函数将依次构建这些控件，直到底层渲染对象。
 */

/*
* 基本控件

Text：文本控件，在应用中创建各种样式的文本。

Row,Column：Flex控件，可以创建水平(Row)或垂直(Column)方向的布局，是基于Web的flexbox的布局模式设计的。

Stack：非线性布局（水平或垂直），控件可以堆叠在其他控件上，可以使用Positioned控件控制Stack相对顶部、右部、底部和左部的位置，是基于Web的absolute定位的布局模式。

Container：创建矩形的可视元素，可以用BoxDecoration来设计样式，比如背景、边框和阴影，Container也有边距、填充和大小限制，另外，还可以在三维空间利用矩阵进行变换。*/
class MyAppBar extends StatelessWidget {
  MyAppBar(this.title);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      //BoxDecoration对象通过backgroundColor属性为容器设置背景颜色。设置border属性给容器添加边框
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu), tooltip: '导航菜单', onPressed: null),
          new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: '搜索', onPressed: null),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _onPresse3() {
      Navigator.of(context).push(new PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return new RoutePageWithValue('来自RoutePage路由测试3');
          },
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return new FadeTransition(
              opacity: animation,
              child: new RotationTransition(
                turns:
                    new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                child: child,
              ),
            );
          }));
    }

    return new Material(
      child: ListView(
        physics: BouncingScrollPhysics(), //BouncingScrollPhysics：iOS下弹性效果。
        children: <Widget>[
          new MyAppBar(new Text('实例标题',
              style: Theme.of(context).primaryTextTheme.title)),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "addRout");
            },
            color: Colors.red,
            child: Text('跳转'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, BottomNavigationDemo.routeName);
            },
            color: Colors.red,
            child: Text('跳转BottomNavigationDemo'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyListApp.routeName);
            },
            color: Colors.red,
            child: Text('跳转多类型列表'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, MySlideDeleteApp.routeName);
            },
            color: Colors.red,
            child: Text('跳转滑动删除列表'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, FirstScreen.routeName);
            },
            color: Colors.red,
            child: Text('跳转navigator'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, TodosScreen.routeName);
            },
            color: Colors.red,
            child: Text('跳转router1'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            color: Colors.red,
            child: Text('跳转router2'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyWebSocketWidget()));
            },
            color: Colors.red,
            child: Text('跳转MyWebSocketWidget'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoadMoreList()));
            },
            color: Colors.red,
            child: Text('跳转下拉刷新,上拉加载更多'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TalkcasuallyApp()));
            },
            color: Colors.red,
            child: Text('跳转到聊天界面'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SingIn()));
            },
            color: Colors.red,
            child: Text('跳转到登陆界面'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyStudyApp()));
            },
            color: Colors.red,
            child: Text('跳转到Flutter总结!'),
          ),
          RaisedButton(
            onPressed: () {
              _onPresse3();
            },
            color: Colors.red,
            child: Text('跳转到路由测试传递参数'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogoApp()));
            },
            color: Colors.red,
            child: Text('跳转到动画案例!'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AnimatedListSample()));
            },
            color: Colors.red,
            child: Text('跳转到动画案例!02'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BasicHeroAnimation()));
            },
            color: Colors.red,
            child: Text('共享元素案例'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShoppingListWidget()));
            },
            color: Colors.red,
            child: Text('list'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyWidgetDemo()));
            },
            color: Colors.red,
            child: Text('widgetdemo'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventBusA()));
            },
            color: Colors.red,
            child: Text('全局事件总线'),
          ),
        ],
      ),
    );
  }
}

main() {
  runApp(new MaterialApp(
    title: '我的应用',
    //应用名称
    home: new MyScaffold(),
    //注册路由表
    routes: {
      "gestureRout": (BuildContext context) => new MyButton(),
      "addRout": (BuildContext context) => new Counter(),
      BottomNavigationDemo.routeName: (BuildContext context) =>
          new BottomNavigationDemo(),
      MyListApp.routeName: (BuildContext context) => new MyListApp(),
      MySlideDeleteApp.routeName: (BuildContext context) =>
          new MySlideDeleteApp(),
      FirstScreen.routeName: (BuildContext context) => FirstScreen(),
      TodosScreen.routeName: (BuildContext context) => TodosScreen(),
      MyApp.routName: (_) => new MyApp(),
      AnimationHome.routName: (_) => AnimationHome(),
      AnimationHome02.routName: (_) => AnimationHome02(),
    },
    debugShowCheckedModeBanner: false,
    //去调debug字样
    localizationsDelegates: [
      //国际化
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('zh', 'CH'),
      const Locale('en', 'US'),
    ],
  ));
}
