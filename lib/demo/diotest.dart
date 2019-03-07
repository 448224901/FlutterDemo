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

/**
 * 多请求
 */
void _dioMuchRequest() async {
  var dio = new Dio();
  final futurePost = dio.post("http://www.wanandroid.com/user/login",
      data: {"username": 123, "password": 123});
  final futureGet = dio
      .get("http://www.wanandroid.com/article/list/0/json", data: {"cid": 60});
  var response = await Future.wait([futureGet, futurePost]);
  print(response.length);
  for (var x = 0; x < response.length; x++) {
    print(response[x].data);
  }
}

/**
 * 下载
 */
void _dioDownload() async {
  var dio = new Dio();
  var response = await dio.download("https://www.baidu.com/", "./baidu.html");
  print("${response.data}===${response.statusCode}");
}

/**
 * 表单上传文件
 */
void _dioForm() async{
  var dio = new Dio();
  var formData = new FormData.from({
    "username":"dart",
    "file1":new UploadFileInfo(new File("./baidu.html"), "baidu.html")
  });
  var response = await dio.post("http://localhost:8911/gradleDemo/servlet/upload/uploadServlet",data: formData);
  print(response.statusCode);
}

main() {
//  _dioGet();
//  _dioPost();
//  _dioMuchRequest();
//  _dioDownload();
_dioForm();
}
