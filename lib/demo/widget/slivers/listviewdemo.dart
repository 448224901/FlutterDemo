import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加载更多列表'),
      ),
      body:LoadMoreList(),
    );
  }
}

class LoadMoreList extends StatefulWidget {
  @override
  _LoadMoreListState createState() => _LoadMoreListState();
}

class _LoadMoreListState extends State<LoadMoreList> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
//      _words.insertAll(_words.length-1,
//      //每次生成20个单词
////          generateWordPairs
//      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
