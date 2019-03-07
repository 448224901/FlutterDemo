import 'package:flutter/material.dart';

///动画

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画demo'),
      ),
      body: GridView.count(
        crossAxisCount: 2,//横向间距
        primary: false,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 8,
        //竖向间距
        crossAxisSpacing: 8,
        children:<Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => null));
            },
            child: Text('animatedContainer'),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }


}
