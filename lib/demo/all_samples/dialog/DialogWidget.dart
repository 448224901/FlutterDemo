import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogWidget extends StatefulWidget {
  @override
  DialogWidgetState createState() => new DialogWidgetState();
}

class DialogWidgetState extends State<DialogWidget> {
  List<String> titles = [
    'AlertDialog',
    'AlertDialog-ListView',
    'AboutDialog',
    'SimpleDialog',
    'CupertinoAlertDialog',
    'CupertinoActionSheet',
    'CupertinoPopupSurface',
  ];

  List<String> subtitles = [
    '底部的按钮最多三个',
    '内容为ListView',
    '含应用程序的图标，名称，版本号和版权',
    '简单的对话框',
    'iOS风格对话框',
    'iOS风格选择框',
    'iOS风格自定义内容',
  ];

  List<bool> bools = [
    false,
    false,
    false,
    false,
    false,
  ];

  int radio = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('AlertDialog'),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            title: Text(titles[index]),
            subtitle: Text(subtitles[index]),
            onTap: () {
              Widget _widget;
              switch (index) {
                case 0:
                  _widget = AlertDialog(
                    title: Text(titles[index]),
//                      titlePadding: EdgeInsets.all(5.0),
                    content: Text('普通的AlertDialog'),
//                      contentPadding: EdgeInsets.all(10.0),
                    semanticLabel: titles[index],
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('取消')),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('考虑一下')),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('确认')),
                    ],
                  );
                  _showDialog(_widget);
                  break;
                case 1:
                  _widget = AlertDialog(
                    title: Text(titles[index]),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          _text('ListView Item 1'),
                          _text('ListView Item 2'),
                          _text('ListView Item 3'),
                          _text('ListView Item 4'),
                          _text('ListView Item 5'),
                          _text('ListView Item 6'),
                          _text('ListView Item 7'),
                          _text('ListView Item 8'),
                          _text('ListView Item 9'),
                          _text('ListView Item 10'),
                          _text('ListView Item 11'),
                          _text('ListView Item 12'),
                        ],
                      ),
                    ),
                  );
                  _showDialog(_widget);
                  break;
                case 2:
                  showAboutDialog(
                      context: context,
                      applicationIcon: Icon(Icons.accessibility),
                      applicationLegalese: 'Flutter 集合大全',
                      applicationName: 'Flutter List',
                      applicationVersion: '1.0.0');
                  break;
                case 3:
                  _showDialog(
                    SimpleDialog(
                      title: Text('SimpleDialog'),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('关闭'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('确认'),
                        )
                      ],
                    ),
                  );
                  break;
                case 4:
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('CupertinoAlertDialog'),
                        content: Text('iOS风格对话框'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('关闭'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('确认'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  break;
                case 5:
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text('CupertinoActionSheet'),
                        message: Text('iOS风格选择框'),
                        cancelButton: CupertinoActionSheetAction(
                          child: Text('我是取消按钮'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: Text('选项一'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('选项二'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('选项三'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  break;
                case 6:
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoPopupSurface(
                        isSurfacePainted: true,
                        child: Container(
                          height: 300.0,
                          alignment: AlignmentDirectional.center,
                          child:  Text(
                            '我是自定义内容',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  break;
              }
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _showDialog(Widget widget) {
    showDialog(
      context: context,
      builder: (context) {
        return widget;
      },
      barrierDismissible: true,
    );
  }

  _text(String text) {
    return InkWell(
      child: Text(text),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
