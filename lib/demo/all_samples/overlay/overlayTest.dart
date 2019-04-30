import 'package:flutter/material.dart';

class OverlayTestWidget extends StatefulWidget {
  @override
  _OverlayTestWidgetState createState() => _OverlayTestWidgetState();
}

class _OverlayTestWidgetState extends State<OverlayTestWidget> {
  OverlayEntry _overlayEntry;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //创建OverlayEntry
    _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
          child: GestureDetector(
            onTap: (){
              _overlayEntry.remove();
            },
            child: Icon(Icons.check_circle),
          ),
        ));
    _addOverlay(context,_overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Demo'),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
                },
              ),
            ),
//            Container(
//              padding: EdgeInsets.all(10),
//              color: Colors.white,
//              child: GestureDetector(
//                child: Text('移除悬浮框'),
//                onTap: (){
//                  _overlayEntry.remove();
//                },
//              ),
//            ),
          ],
        ),
    );
  }

  void _addOverlay(BuildContext context,OverlayEntry _overlayEntry) async {
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    //显示到屏幕上。
    overlayState.insert(_overlayEntry);
  }
}
