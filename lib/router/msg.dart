import 'package:flutter/material.dart';
import 'package:flutter_app/router/demo01.dart';
class MsgPage extends StatelessWidget {
  var parentContext;
  MsgPage(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: PageWidget(parentContext),
      ),
      routes: <String,WidgetBuilder>{
        Demo01.routName:(BuildContext context)=>Demo01(),
      },
    );
  }
}

class PageWidget extends StatefulWidget {
  var parentContext;
  PageWidget(this.parentContext);

  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息'),
      ),
      body: Center(
        child: RaisedButton(onPressed: _pushPage,child: Text('跳转'),),
      ),
    );
  }

  _pushPage(){
    Navigator.of(widget.parentContext).push(MaterialPageRoute(builder: (context){
      return Demo01();
    }));
  }
}

