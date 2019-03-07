import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/*
WebSockets
步骤
1.连接到WebSocket服务器。
2.监听来自服务器的消息。
3.将数据发送到服务器。
4.关闭WebSocket连接。
 */
class MyWebSocketWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'WebSocket Demo';
    return MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
        channel: new IOWebSocketChannel.connect('ws://echo.websocket.org'),//我们可以创建一个WebSocketChannel连接到一台服务器：
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;

  const MyHomePage({Key key, this.title, this.channel}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message'),
            )),
//            监听来自服务器的消息  我们将使用一个StreamBuilder Widget来监听新消息
            //WebSocketChannel提供了一个来自服务器的消息Stream 。
            //该Stream类是dart:async包中的一个基础类。它提供了一种方法来监听来自数据源的异步事件。与Future返回单个异步响应不同，Stream类可以随着时间推移传递很多事件。
            //该StreamBuilder Widget将连接到一个Stream， 并在每次收到消息时通知Flutter重新构建界面。
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  //用一个Text Widget来显示它们。
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ),
    );
  }
  void _sendMessage(){
    if(_controller.text.isNotEmpty){
      //将数据发送到服务器 为了将数据发送到服务器，我们会add消息给WebSocketChannel提供的sink。
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //关闭WebSocket连接
    widget.channel.sink.close();
    super.dispose();
  }
}
