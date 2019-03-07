import 'dart:io';
import 'dart:async';
import 'dart:convert';

void main() async{
  //复制文件演示
 await copyFileByStream();
}

copyFileByStream() async {
  //电子书文件大小：10.9 MB (11,431,697 字节)
  File file = new File(r"D:\111.pdf");
  assert(await file.exists() == true);
  print("源文件：${file.path}");

  //以只读方式打开源文件数据流
  Stream<List<int>> inputStream = file.openRead();
  //数据流监听事件，这里onData是null
  //会在后面通过StreamSubscription来修改监听函数
  StreamSubscription subscription = inputStream.listen(null);

  File target = new File(r"d:\222.pdf");
  print("目标文件：${target.path}");
  //以WRITE方式打开文件，创建缓存IOSink
  IOSink sink = target.openWrite();

  //常用两种复制文件的方法，就速度来说，File.copy最高效
//  //经测试，用时21毫秒
//  await file.copy(target.path);
//  //输入流连接缓存，用时79毫秒，比想象中高很多
//  //也许是数据流存IOSink缓存中之后，再转存到文件中的原因吧！
//  await sink.addStream(inputStream);

  //手动处理输入流
  //接收数据流的时候，涉及一些简单的计算
  //如：当前进度、当前时间、构造字符串
  //但是最后测试下来，仅用时68毫秒，有些不可思议

  //文件大小
  int fileLength = await file.length();
  //已读取文件大小
  int count = 0;
  //模拟进度条
  String progress = "*";

  //当输入流传来数据时，设置当前时间、进度条，输出信息等
  subscription.onData((list) {
    count = count + list.length;
    //进度百分比
    double nums = (count*100)/fileLength;
    DateTime time = new DateTime.now();

    //输出样式：[1:19:197]**********[20.06%]
    //进度每传输2%，多一个"*"
    //复制结束进度为100%，共50个"*"
    print("[${time.hour}:${time.second}:${time.millisecond}]${progress*(nums ~/ 2)}[${nums.toStringAsFixed(2)}%]");
    print('测试');
    //将数据添加到缓存池
    sink.add(list);
  });

  //数据流传输结束时，触发onDone事件
  subscription.onDone(() {
    print("复制文件结束！");
    //关闭缓存释放系统资源
    sink.close();
  });
}


