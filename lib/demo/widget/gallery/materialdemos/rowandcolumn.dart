import 'package:flutter/material.dart';

class RowAndColumnWidget extends StatelessWidget {
  Widget _getRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget _getColumn() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('水平和垂直布局'),
        ),
        body: Container(
          height: 800,
          child: Column(
            children: <Widget>[
              _getRow(),
              Expanded(
                child: _getColumn(),
              ),
            ],
          ),
        ));
  }
}
