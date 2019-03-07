import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/router/demo02.dart';

//目前国外比较流行的页面传值是用fluro等第三方插件。
var router = Router();

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    router.define('demo02/:data', handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return Demo02(params['data'][0]);
        }));
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text('登陆'),
        ),
        body: new Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          Container(
            height: 30.0,
            color: Colors.blue,
            child: FlatButton(
                onPressed: () {
                  var bodyJson = '{"user":小强,"pass":3041}';
                  router.navigateTo(context, 'demo02/$bodyJson');
                },
                child: const Text('传递账号密码')),
          ),
          RaisedButton(onPressed: () {
            _navigator(context);
          }, child: Text("跳转并返回结果"),)
        ],
      ),
    );
  }

  /**
   * 第一种异步方式 async await
   */
  _navigator(BuildContext context) {
    print("--------c----------");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SelectionScreen())).then((result){
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
    }).catchError((error){
      print('$error');
    });
    print('--------d------------');
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getPadding(context, "三级头"),
            _getPadding(context, '三级甲'),
          ],
        ),
      ),
    );
  }
}

Widget _getPadding(BuildContext context, String text) {
  return Padding(padding: const EdgeInsets.all(8.0),
    child: RaisedButton(
      onPressed: () {
        Navigator.pop(context, text);
      }
      , child: Text(text),),);
}