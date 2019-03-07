import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownLoadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('下载'),
      ),
      body: MyDownLoadWidget(),
    );
  }
}

class MyDownLoadWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyDownLoadWidgetState();
  }
}

class _MyDownLoadWidgetState extends State<MyDownLoadWidget> {
  var progress = '0';

  var picPath = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var get_localFile = get_LocalFile();
    get_localFile.then((value) {
      print('value:$value');
      picPath = value;
      setState(() {
        print('picPath:$picPath');
      });
    });
    print(picPath);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            downLoadts((received, total) {
              setState(() {
                print((received / total * 100).toStringAsFixed(0) + "%");
                progress = (received / total * 100).toStringAsFixed(0);
              });
            });
          },
          child: Text('download'),
        ),
        Text("$progress%"),
        // ignore: argument_type_not_assignable
        Image.file(File(picPath)),
        RaisedButton(
          onPressed: () {
            getExternalStorageDirectory().then((value){
              print('loacl:${value.path}');
            });
          },
          child: Text('本地路径'),
        ),
        RaisedButton(onPressed: (){
          _dio();
        },
        child: Text('网络请求'),)
      ],
    );
  }
}

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

Future<String> get_LocalFile() async {
  Directory dir = await getApplicationDocumentsDirectory();
  return '${dir.path}/flutter.png';
}

Future<Null> downLoadts(OnDownloadProgress onPro) async {
  var dio = Dio();
  dio.onHttpClientCreate = (HttpClient client) {
    client.idleTimeout = Duration(seconds: 0);
  };
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  var file = new File('$appDocPath/flutter.png');
  var exists = file.existsSync();
  print('exists:$exists');
  if (!exists) {
    file.create();
  }
  var url = "https://flutter.io/images/flutter-mark-square-100.png";
  try {
    Response response =
        await dio.download(url, '$appDocPath/flutter.png', onProgress: onPro);
    print(response.statusCode);
    if(response.statusCode!=200){
      throw '请求出错';
    }
  } catch (e) {
    print(e);
  }
  print("download succeed!");
}
