import 'package:flutter/material.dart';

class MessageFromWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: MessageFrom(),
    );
  }
}


class MessageFrom extends StatefulWidget {
  @override
  _MessageFromState createState() => _MessageFromState();
}

class _MessageFromState extends State<MessageFrom> {
  final editController = TextEditingController();

  // 对象被从 widget 树里永久移除的时候调用 dispose 方法（可以理解为对象要销毁了）
  // 这里我们需要主动再调用 editController.dispose() 以释放资源
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          // 我们让输入框占满一行里除按钮外的所有空间
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Input message',
                  contentPadding: EdgeInsets.all(0.0),
                ),
                style: TextStyle(fontSize: 20.0, color: Colors.black54),
                controller: editController,
                // 自动获取焦点。这样在页面打开时就会自动弹出输入法
                autofocus: true,
              ),
            ),
          ),
          InkWell(
            onTap: () => debugPrint('send: ${editController.text}'),
            onDoubleTap: ()=>debugPrint('double tapped'),
            onLongPress: ()=>debugPrint('long pressed'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text('send'),
            ),
          ),
        ],
      ),
    );
  }
}
