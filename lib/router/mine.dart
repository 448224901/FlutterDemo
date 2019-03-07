import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text('我的'),
        ),
        body: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                launch('https://www.baidu.com/');
              },
              child: Text('进入百度'),
            )
          ],
        ),
      ),
    );
  }
}
