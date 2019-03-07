import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';

//async awit 处理异步请求
void _dio() async {
  try {
    Dio dio = new Dio();
    Response response = await dio.get("https://www.baidu.com/");
    print(response.data);
  } catch (e) {
    print("请求出错");
  }
}

/**
 * get请求带参数
 */
void _dioGet() async {
  var dio = new Dio();
  var response = await dio
      .get("http://www.wanandroid.com/article/list/0/json", data: {"cid": 60});
  print(response.data);
}

/**
 * post请求
 */
void _dioPost() async {
  var dio = new Dio();
  var response = await dio.post("http://www.wanandroid.com/user/login",
      data: {"username": 123, "password": 123});
  print(response.data);
}

void _dioMuchRequest() async {
  var dio = new Dio();
  final futurePost = dio.post("http://www.wanandroid.com/user/login",
      data: {"username": 123, "password": 123});
  final futureGet = dio
      .get("http://www.wanandroid.com/article/list/0/json", data: {"cid": 60});
  var response = await Future.wait([futureGet, futurePost]);
  print(response.toString());
}

main() {
//  _dioGet();
  _dioPost();
//  _dioMuchRequest();
}
