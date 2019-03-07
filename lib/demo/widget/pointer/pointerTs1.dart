import 'package:flutter/material.dart';

class PointerTsOneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("触摸事件测试"),
      ),
      body:PointerTsOne(),
    );
  }
}

class PointerTsOne extends StatefulWidget {
  @override
  _PointerTsOneState createState() => _PointerTsOneState();
}

class _PointerTsOneState extends State<PointerTsOne> {
  //定义一个状态，保存当前指针位置
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
      ),
      onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
      onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
      onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
    );
  }
}

class PointerTsTwoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("触摸点透"),),
      body: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue)),
            ),
            onPointerDown: (event) => print("down0"),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 100.0)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击")),
            ),
            onPointerDown: (event) => print("down1"),
            behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
          )
        ],
      ),
    );
  }
}
