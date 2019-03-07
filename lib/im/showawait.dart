import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/im/imhome.dart';

class ShowAwait extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShowAwaitState();
  }
}

class _ShowAwaitState  extends State<ShowAwait>{
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Timer(Duration(seconds: 2),(){
//      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder:(context)=>TalkcasuallyApp()));
    });
  }
}
