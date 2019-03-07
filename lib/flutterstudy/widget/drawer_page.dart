import 'package:flutter/material.dart';
import 'package:flutter_app/router/router1.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: DrawerWidget(),
    );
  }
}

class DrawerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrawerWidgetState();
  }
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.only(),
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('张三'),
          accountEmail: Text('123456@qq.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('http://n.sinaimg.cn/translate/20170726/Zjd3-fyiiahz2863063.jpg'),
          ),
        ),
        new ListTile(
            title: new Text('lifecycle 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
//              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/flutterstudy/LifecyclePage');
            }),
        new Divider(),
      ],
    );
  }
}
