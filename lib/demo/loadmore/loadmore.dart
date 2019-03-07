import 'package:flutter/material.dart';

class LoadMoreList extends StatefulWidget {
  var title = "加载更多";

  @override
  State<StatefulWidget> createState() {
    return _LoadMoreList();
  }
}

class _LoadMoreList extends State<LoadMoreList> {
  List list = new List(); //列表要展示的数据
  var _scrollController = ScrollController(); //listview的控制器
  int _page = 1; //加载的页数
  bool isLoading = false; //是否正在加载数据

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        //下拉刷新控件
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index < list.length) {
              return ListTile(
                title: Text(list[index]),
              );
            }
            return _getMoreWidget();
          },
          itemCount: list.length + 1,
          controller: _scrollController,
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //滑动到底部
        _getMore();
      }
    });
  }

  /**
   * 下拉刷新方法，为list重新赋值
   */
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
        _page = 1;
        list = List.generate(20, (i) => '这是刷新的第$i条数据');
      });
    });
  }

  /**
   * 初始化list数据  加延时模仿网络请求
   */
  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list = List.generate(15, (i) => '我是第$i条数据');
      });
    });
  }

  /**
   * 上拉加载更多
   */
  Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
          list.addAll(List.generate(5, (i) => '第$_page次上拉来的数据'));
          _page++;
          isLoading = false;
        });
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  /**
   * 加载更多时显示的组件,给用户提示
   */
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, //水平对齐方式
          crossAxisAlignment: CrossAxisAlignment.center, //垂直对齐方式
          children: <Widget>[
            Text(
              '加载中.....',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
