import 'package:flutter/material.dart';

void main() {
  List<Widget> items = new List();
  for (var i = 0; i < 20; i++) {
//    items.add(new Text('List Item $i'));
    var text = new Text('List Item $i');
    items.add(new Padding(
      // 内边距设置为15.0，上下左右四边都是15.0
      padding: const EdgeInsets.all(15.0),
      child: text,
    ));
  }
  runApp(new MaterialApp(
    title: 'list demo',
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('text demo'),
      ),
      body: new Center(
        //build是ListView提供的静态方法，用于创建ListView
        child: new ListView.builder(
//            itemCount是ListView的item个数，这里之所以是items.length * 2是因为将分割线也算进去了
            itemCount: items.length*2,
            itemBuilder: (context,index){
              //如果index为奇数，则返回分割线
              if(index.isOdd){
                return new Divider(height: 1.0);
              }
              //这里index为偶数，为了根据下标取items中的元素，需要对index做取整
              index = index ~/2;
              return items[index];
            }),
      ),
    ),
  ));
}
