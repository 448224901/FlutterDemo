import 'package:flutter/material.dart';

class RowWidgetDemo extends StatefulWidget {
  @override
  _RowWidgetDemoState createState() => _RowWidgetDemoState();
}

class _RowWidgetDemoState extends State<RowWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('水平布局'),
      ),
      body: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 30,
              height: 30,
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 40,
              height: 40,
              child:
                  DecoratedBox(decoration: BoxDecoration(color: Colors.green)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 50,
              height: 50,
              child:
                  DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('text文本'),
          ),
        ],
      ),
    );
  }
}
