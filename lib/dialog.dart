import 'package:flutter/material.dart';

class MyAlertDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        showDialog<Null>(
            context: context,
            barrierDismissible: false, //不能点击对话框外关闭对话框,必须点击按钮关闭
            builder: (BuildContext context) {
              return new AlertDialog(
                title: new Text('提示'),
                content: new Text(
                    '微软重申Windows 7将在2020年1月到达支持终点，公司希望利用这个机会说服用户在最新更新发布之前升级到Windows 10。'),
                actions: <Widget>[
                  new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text('明白了'))
                ],
              );
            });
      },
      child: new Text('显示AlertDialog'),
    );
  }
}

class MySimpleDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
        child: new Text('显示simpleDialog'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext ctx){
              return new SimpleDialog(
                title: new Text('这是simpleDialog'),
                children: <Widget>[
                  new SimpleDialogOption(
                    onPressed: (){Navigator.pop(context);},
                    child: const Text('确定'),
                  ),
                  new SimpleDialogOption(
                    onPressed: (){Navigator.pop(context);},
                    child: const Text('取消'),
                  ),
                ],
              );
            }
          );
        });
  }
}
