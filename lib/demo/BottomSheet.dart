import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  /*
    GlobalKey：整个应用程序中唯一的键
    ScaffoldState：Scaffold框架的状态
    解释：_scaffoldKey的值是Scaffold框架状态的唯一键
   */
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //VoidCallback：没有参数并且不返回数据的回调
  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 禁用按钮
    _showBottomSheetCallback = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      //禁用按钮
      _showBottomSheetCallback = null;
    });
    /*
      currentState：获取具有此全局键的树中的控件状态
      showBottomSheet：显示持久性的质感设计底部面板
      解释：联系上文，_scaffoldKey是Scaffold框架状态的唯一键，因此代码大意为，
           在Scaffold框架中显示持久性的质感设计底部面板
     */
    _scaffoldKey.currentState
        .showBottomSheet<Null>((BuildContext context) {
          final ThemeData themeData = Theme.of(context);
          return Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: themeData.disabledColor))),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                '这是一个持久性的底部面板，向下拖动即可将其关闭',
                textAlign: TextAlign.center,
                style: TextStyle(color: themeData.accentColor, fontSize: 24.0),
              ),
            ),
          );
        })
        /*
      closed：当此对象控制的元素不再可见时完成
      whenComplete：注册将在此未来完成时调用的函数
      解释：联系上文，closed控制的元素是新构建的质感设计底部面板，因此代码大意为，
           注册底部面板不再可见时调用的函数
     */
        .closed
        .whenComplete(() {
          // mounted：bool值，这个State对象当前是否在树中
          if (mounted) {
            setState(() {
              // 重新启用按钮
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  void _showMessage() {
    // showDialog<T>：显示应用程序当前内容上方的对话框
    showDialog<Null>(
      context: context,
      // AlertDialog：质感设计中的告警对话框
      child: AlertDialog(
        // content：对话框的可选内容，以浅色字体显示在对话框的中心
        content: Text('你点击了浮动按钮'),
        // actions：显示在对话框底部的可选操作
        actions: <Widget>[
          // FlatButton：质感设计中的平面按钮
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('确定'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('底部面板'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showMessage,
        backgroundColor: Colors.redAccent[200],
        child: Icon(Icons.add),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _showBottomSheetCallback,
          child: Text('显示底部面板'),
        ),
      ),
    );
  }
}

main(){
  runApp(MaterialApp(
    title: 'BottomSheet',
    home: MyApp(),
  ));
}
