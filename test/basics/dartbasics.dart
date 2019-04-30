import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:http/http.dart';

main() async {
//  test01();
  var f = await testAsync();
  print('1到1000之和:$f');
// String response = await loadData();
// print(response);
//  await getDate();
// await thenTest();
  await loadIoslateData();
}

/*
dart中异步async和await必须一起使用
* */

test01() {
  var a = String.fromCharCode(1);
  var b = String.fromCharCode(1);
  print('The type of a is ${a.runtimeType}');
}

Future<int> testAsync() async {
  int f = 0;
  for (int i = 1; i < 1000; i++) {
    f += i;
  }
  return f;
}

dataRequest() async {
  String requestURL = 'https://jsonplaceholder.typicode.com/posts';
  Client client = Client();
  Future<Response> response = client.get(requestURL);
  return response;
}

Future<String> loadData() async {
  Response response = await dataRequest();
  return response.body;
}

getDate() async{
  var now = DateTime.now();
  print('request begin $now');
  await Future.delayed(Duration(seconds: 1), () {
    now = DateTime.now();
    print('request begin $now');
  });
}

///future链式调用
thenTest() async{
  await Future.delayed(Duration(seconds: 1),(){
    int age = 18;
    return age;
  }).then((onValue){
    onValue++;
    print('age$onValue');
  });
}


///isolate 创建线程
loadIoslateData() async {
  // 通过spawn新建一个isolate，并绑定静态方法
  ReceivePort receivePort =ReceivePort();
  await Isolate.spawn(dataLoader, receivePort.sendPort);

  // 获取新isolate的监听port
  SendPort sendPort = await receivePort.first;
  // 调用sendReceive自定义方法
  List dataList = await sendReceive(sendPort, 'https://jsonplaceholder.typicode.com/posts');
  print('dataList $dataList');
}

// isolate的绑定方法
dataLoader(SendPort sendPort) async{
  // 创建监听port，并将sendPort传给外界用来调用
  ReceivePort receivePort =ReceivePort();
  sendPort.send(receivePort.sendPort);

  // 监听外界调用
  await for (var msg in receivePort) {
    String requestURL =msg[0];
    SendPort callbackPort =msg[1];

    Client client = Client();
    Response response = await client.get(requestURL);
    List dataList = json.decode(response.body);
    // 回调返回值给调用者
    callbackPort.send(dataList);
  }
}

// 创建自己的监听port，并且向新isolate发送消息
Future sendReceive(SendPort sendPort, String url) {
  ReceivePort receivePort =ReceivePort();
  sendPort.send([url, receivePort.sendPort]);
  // 接收到返回值，返回给调用者
  return receivePort.first;
}


