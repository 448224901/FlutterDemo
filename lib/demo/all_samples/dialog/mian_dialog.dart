import 'package:flutter/material.dart';
import 'package:flutter_app/demo/all_samples/dialog/DialogWidget.dart';
import 'package:flutter_app/demo/all_samples/dialog/alert_dialog_demo.dart';

class MainDiaLogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('dialog例子'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AlertDialogDemo()));
            },
            color: Colors.blue,
            child: Text('alertDialog'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DialogWidget()));
            },
            color: Colors.blue,
            child: Text('dialog集合'),
          ),
        ],
      ),
    );
  }
}
