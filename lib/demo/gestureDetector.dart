import 'package:flutter/material.dart';
/**
 *GestureDetector手势处理
 **/

main() {
  runApp(new MaterialApp(
    title: '手势判断',
    home: new MyButton(),
  ));
}
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        print('被点击');
      },
      child: new Container(
        height: 36.0,
        padding:const EdgeInsets.all(8.0),
        margin:const EdgeInsets.symmetric(horizontal: 8.0) ,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(Radius.circular(5.0)),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('点击监听'),
        ),
      ),
    );
  }

}