import 'package:flutter/material.dart';
import 'dialog.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('test'),
        ),
        body: new Column(
          children: <Widget>[
            new RaisedButton(child: new Text("raiseButton"), onPressed: null),
            new FloatingActionButton(
                child: new Icon(Icons.add), onPressed: null),
            new FlatButton(onPressed: null, child: new Text("flatButton")),
            new IconButton(icon: new Icon(Icons.list), onPressed: null),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new InkWell(
                child: new Text('MyAlertDialogView'),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyAlertDialogView()));
                },
              ),
            ),
            new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new InkWell(
                  child: new Text('MySimpleDialogView'),
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MySimpleDialogView()));
                  },
                )),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new TextField(
                  maxLines: 8, // 设置输入框显示的最大行数（不是可输入的最大行数）
                  maxLength: 30, // 设置输入框中最多可输入的字符数
                  decoration: new InputDecoration( // 给输入框添加样式
                      hintText: "Input something...", // 输入框中placeholder文本
                      border: new OutlineInputBorder( // 输入框的边框
                          borderRadius: const BorderRadius.all(Radius.circular(1.0))
                      )
                  ),
              ),
            ),
            new Image.asset('images/timg.jpg',width: 200.0,height: 100.0,fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
