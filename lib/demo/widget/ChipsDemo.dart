import 'package:flutter/material.dart';

class ChipsDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipsDemo'),
      ),
      body: ListView(
        children: <Widget>[
          buildChoiceChip(),
          buildActionChip(),
          buildFilterChip(),
          buildChip(),
          buildInputChip(),
          buildRawChip(),
          Column(
            children: _setChildren(),
          ),
          new Text(
            '请输入用户名1',
            style: new TextStyle(fontSize: 15.0, color: Colors.teal),
          ),
          buildTextField(maxLength: 30),
          new Text(
            '请输入密码1',
            style: new TextStyle(fontSize: 15.0, color: Colors.teal),
          ),
          buildTextField(
              obscureText: true, maxLength: 16, maxLengthEnforced: true),
          new Text(
            '请输入用户名2',
            style: new TextStyle(fontSize: 15.0, color: Colors.teal),
          ),
          buildTextField(),
          new Text(
            '请输入密码2',
            style: new TextStyle(fontSize: 15.0, color: Colors.teal),
          ),
          buildTextField(
              obscureText: true, maxLength: 16, maxLengthEnforced: false),
        ],
      ),
    );
  }
}

Widget buildChoiceChip() {
  return new ChoiceChip(
    label: new Container(
      width: 130.0,
      child: new Row(
        children: <Widget>[
          new Text(
            'ChoiceChip示例',
            style: new TextStyle(color: Colors.white),
          ),
          new SizedBox(
            width: 5.0,
          ),
          new CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 10.0,
            child: new Icon(
              Icons.close,
              color: Colors.white,
              size: 10.0,
            ),
          ),
        ],
      ),
    ),
//    labelStyle: new TextStyle(color: Colors.white),
    avatar: new CircleAvatar(
      backgroundColor: Colors.deepOrange,
      child: new Text('哈'),
    ),
    selected: true,
    onSelected: (bool) {
      print('点击了ChoiceChip');
    },
    selectedColor: Colors.blue,
  );
}

Widget buildActionChip() {
  return new ActionChip(
      label: new Text('ActionChip示例'),
      avatar: new CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent,
        child: new Text('哈'),
      ),
      onPressed: () {
        print('选择了XXX');
      });
}

Widget buildFilterChip() {
  return new FilterChip(
      label: new Text('FilterChip示例'),
      avatar: new CircleAvatar(
        backgroundColor: Colors.lime,
        child: new Text('哈'),
      ),
      onSelected: (bool) {
        print(bool);
      });
}

Widget buildChip() {
  return new Chip(
    label: new Text('Chip示例'),
    avatar: new CircleAvatar(
      backgroundColor: Colors.teal,
      child: new Text('哈哈'),
    ),
  );
}

Widget buildInputChip() {
  return new InputChip(
    label: new Text('InputChip示例'),
    avatar: new CircleAvatar(
      backgroundColor: Colors.tealAccent,
      child: new Text('哈'),
    ),
  );
}

Widget buildRawChip() {
  return new RawChip(
    label: new Text('RawChip示例'),
    avatar: new CircleAvatar(
      backgroundColor: Colors.pinkAccent,
      child: new Text('哈'),
    ),
  );
}

/// 设置所有的列
/// 其中Text的相关属性：
/// color 颜色
/// decoration 删除线
/// decorationColor 删除线颜色
/// decorationStyle 删除线样式
/// fontSize 大小
/// fontStyle 斜体
/// fontFamily 字体
/// fontWeight 字体粗细
/// height 跨度
/// letterSpacing 字母间隔
List<Widget> _setChildren() {
  return <Widget>[
    new Text(
      '红色+黑色删除线+25号',
      style: new TextStyle(
        color: const Color(0xffff0000),
        decoration: TextDecoration.lineThrough,
        decorationColor: const Color(0xff000000),
        fontSize: 25.0,
      ),
    ),
    new Text(
      '橙色+下划线+24号',
      style: new TextStyle(
        color: const Color(0xffff9900),
        decoration: TextDecoration.underline,
        fontSize: 24.0,
      ),
    ),
    new Text(
      '虚线上划线+23号+倾斜',
      style: new TextStyle(
        decoration: TextDecoration.overline,
        decorationStyle: TextDecorationStyle.dashed,
        fontSize: 23.0,
        fontStyle: FontStyle.italic,
      ),
    ),
    new Text(
      'serif字体+24号',
      style: new TextStyle(
        fontFamily: 'serif',
        fontSize: 26.0,
      ),
    ),
    new Text(
      'monospace字体+24号+加粗',
      style: new TextStyle(
        fontFamily: 'monospace',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    new Text(
      '天蓝色+25号+2行跨度',
      style: new TextStyle(
        color: const Color(0xff4a86e8),
        fontSize: 25.0,
        height: 2.0,
      ),
    ),
    new Text(
      '24号+2个字母间隔',
      style: new TextStyle(
        fontSize: 24.0,
        letterSpacing: 2.0,
      ),
    ),
  ];
}

Widget buildTextField(
    {bool obscureText = false, int maxLength, bool maxLengthEnforced = false}) {
  return new TextField(
//    decoration: new InputDecoration(),
//    focusNode:,
//    处理交互操作的
//    controller:,
//    keyboardType: TextInputType.text,
    style: new TextStyle(color: Colors.teal),
    textAlign: TextAlign.start,
    autofocus: false,
    //是否加黑点隐藏输入字符 false为显示所有字符 true隐藏字符
    obscureText: obscureText,
    //自动更正
    autocorrect: true,
    maxLines: 1,
    maxLength: maxLength,
    // 如果为true，则阻止字段允许超过[maxLength]个字符。
    maxLengthEnforced: maxLengthEnforced,

    ///可选的输入验证和格式化重写。
    ///格式器在文本输入发生变化时按照所提供的顺序运行。
//    inputFormatters:,
//    如果为false，则文本字段为“禁用”：它将忽略点击并将其decoration置为灰色
    enabled: true,
    onChanged: (String) {
      print('onChanged  ==> ' + String);
    },
    onSubmitted: (String) {
      print('onSubmitted  ==> ' + String);
    },
  );
}