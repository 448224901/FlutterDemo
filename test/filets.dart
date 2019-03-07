import 'dart:io';

main() {
//  getTempPath();
//  deleteFile();
//  renameFile();
//  createFile();
//  readAsStr();
//  readAsLines();
//  readAsBytes();
  writeAsString();
}

getTempPath() {
  //获取系统临时目录
  var systemTemp = Directory.systemTemp;
  print(systemTemp.path);
}

deleteFile() {
  //在系统临时目录下创建文件
  var file = File('D://');
  Directory.systemTemp.createTemp('my_temp_dir').then((directory) {
    //检查文件是否存在
    directory.exists().then(print);
    //删除文件
    return directory.delete();
  }).then((directory) {
    //再次检查文件是否存在
    directory.exists().then(print);
  });
}

void renameFile() {
  //获得系统临时目录
  var systemTempDir = Directory.systemTemp;
  //创建一个文件
  new File('${systemTempDir.path}/foo.txt').create().then((file) {
    print('文件的路径在${file.path}');
    //重命名文件
    return file.rename('${systemTempDir.path}/bar.txt');
  }).then((file) {
    print('文件的路径在${file.path}');
  });
}

createFile() {
  var path2 = File('D:/filetest').path;
  print('path2$path2');
  //d盘创建一个文件
  File('D:/filetest/file.txt').create().then((file) {
    print('path:${file.path}');
  });
  //创建一个目录和一个文件
  File('D:/filetest/file/file.txt').create(recursive: true).then((file) {
    print('dir:$file');
  });
}

var parPath = 'D:/filetest';
/**
 * 字符串读取文件
 */
readAsStr() async {
  var file = File('D:/filetest/file.txt');
  //先判断文件是否存在
  print(file.existsSync());
  var boll = await file.exists();
  if (boll) {
    print('file:${file.path}');
    file.readAsString().then((str) {
      print('str:$str');
    });
  }
}

/**
 * 以列表读取文件
 */
readAsLines() {
  var file = File('D:/filetest/file.txt');
  //先判断文件是否存在
  print(file.existsSync());
  file.readAsLines().then((lines) {
    lines.forEach((line) {
      print('line:$line');
    });
  });
}

/**
 * 字节读取文件
 */
readAsBytes() {
  var file = File('D:/filetest/file.txt');
  file.readAsBytes().then((bytes) {
    print(bytes.toString());
  });
}

var file = File('D:/filetest/file.txt');

readAsStream() {
  var file = File('D:/filetest/file.txt');

  Stream<List<int>> inputStream = file.openRead();
  //解码为UTF8
//        inputStream.transform(UTF8.decoder)
  //流转换为列表
//      .transform(new LineSplitter())
  //设置输出
//      .listen((String line) {
//    print('$line有${line.length}个字节');
//  },
//      onDone: () { print('文件已关闭'); },
  //出错时输出错误信息
//      onError: (e) { print(e.toString()); });
}

writeAsString() async {
  var file = File('D:/filetest/file.txt');
  //先判断文件是否存在
  print(file.existsSync());
//  await file.writeAsString('dart').then((file1) {
//    var file2 = file1;
//    print('file2');
//    file.readAsString().then(print);
//  });
  var writeAsString =await file.writeAsString('dart02');
  print(writeAsString.path);
}
