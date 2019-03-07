import 'dart:convert';
import 'package:http/http.dart' as http;

//通过网络加载JSON文件的实例
void _networkLoading() {
  print('netdate');
  // 将给定标头的HTTP GET请求发送到给定的URL，并注册回调，参数为HTTP响应
  http
      .get('https://domokit.github.io/examples/stocks/data/stock_data_2.json')
      .then((http.Response response) {
    // 响应的主体作为字符串返回
    String netData = response.body;
    print('netdate$netData');
    // JsonDecoder类解析JSON字符串并构建相应的对象
    JsonDecoder decoder = JsonDecoder();
    // 将给定的JSON字符串输入转换为其对应的对象
    List<List<String>> json = decoder.convert(netData);
    print(json[0][1]);
  });
}

main() {
  _networkLoading();
}
