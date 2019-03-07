import 'package:flutter/material.dart';
import 'package:flutter_refresh/flutter_refresh.dart';

class FlutterRefreshWidget extends StatefulWidget {
  @override
  _FlutterRefreshWidgetState createState() => _FlutterRefreshWidgetState();
}

class _FlutterRefreshWidgetState extends State<FlutterRefreshWidget> {
  var _itemCount = 10;

  Future<Null> onFooterRefresh() {
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _itemCount += 10;
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _itemCount = 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新，上拉加载更多'),
      ),
      body: Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: onHeaderRefresh,
        childBuilder: (context,
            {ScrollController controller, ScrollPhysics physics}) {
          return Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("第$index条数据"),
                );
              },
              physics: physics,
              controller: controller,
              itemCount: _itemCount,
            ),
          );
        },
      ),
    );
  }
}
