import 'package:flutter/material.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/BottomNavigationDemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/CardView.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/FABperTab.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/FractionallySizedBoxDemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/Offstagedemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/OverflowBoxDemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/SizedBoxDemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/TransformDemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/bottom_app_bar.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/chips.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/containerDemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/flowdemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/persistentBottomSheet.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/rowandcolumn.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/stackdemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/tabledemo.dart';
import 'package:flutter_app/demo/widget/gallery/materialdemos/wrapdemo.dart';

class MaterialWidget extends StatefulWidget {
  @override
  _MaterialWidgetState createState() => _MaterialWidgetState();
}

class _MaterialWidgetState extends State<MaterialWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContainerWidget()));
            },
            child: Text('Container'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FractionallySizedBoxWidget()));
            },
            child: Text('FractionallySizedBoxWidget'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OffstageWidget()));
            },
            child: Text('控件的显示隐藏'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OverflowBoxWidget()));
            },
            child: Text('OverflowBoxWidget'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SizedBoxWidget()));
            },
            child: Text('sixedBox'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TransformWidget()));
            },
            child: Text('transform'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RowAndColumnWidget()));
            },
            child: Text('rowAndColumn'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StackWidget()));
            },
            child: Text('绝对布局'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FlowWidget()));
            },
            child: Text('flow'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TableWidget()));
            },
            child: Text('table'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WrapWidget()));
            },
            child: Text('wrap'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomAppBarWidget()));
            },
            child: Text('bottom_app_bar'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigationDemo()));
            },
            child: Text('bottom navigation'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersistentBottomSheetDemo()));
            },
            child: Text('PersistentBottomSheet'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TabsFabDemo()));
            },
            child: Text('FabperTab'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CardsDemo()));
            },
            child: Text('CardView'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChipDemo()));
            },
            child: Text('chipView'),
          )
        ],
      ),
    );
  }
}
