import './util.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

main() {
  print('hello');
  print(add(1, 2));
//  getNetData().then((str){
//    print(str);
//  });
  String str = 'Dart strings';
  print(str.contains('D'));
  print(str.contains(new RegExp(r'[A-Z]')));
  print(str.contains('D', 0));
  print(str.contains(new RegExp(r'[A-Z]'), 0));

  String str1 = '86';
  print(str1.padLeft(4, '0'));
  print(str1.padRight(4, '0'));

//  验证邮政编码的正则，返回是否匹配的布尔值
  RegExp postalcode = new RegExp(r'(\d{6})');
  print(postalcode.hasMatch("518000"));

//  验证手机号码的正则，以Iterable< Match >返回所有匹配项
  RegExp mobile = new RegExp(r"(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
  Iterable<Match> mobiles = mobile.allMatches("13812345678 12345678901 17012345678");
  for (var value in mobiles) {
    String match = value.group(0);
    print(match);
  }
//  验证网址URL的正则，如果匹配成功以Match返回匹配项，否则返回null
  RegExp url = new RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
  print(url.firstMatch("http://www.google.com"));
//  验证身份证号码的正则，返回第一个匹配的字符串
  RegExp identity = new RegExp(r"\d{17}[\d|x]|\d{15}");
  print(identity.stringMatch("My id number is 35082419931023527x"));
  testException();
}

Future<String> getNetData() async {
  http.Response res = await http.get("http://www.baidu.com");
  print(res.body);
  return res.body;
}

void testException(){
  try{
    //自定义异常
    throw new FormatException("错误");
  }on FormatException catch(e){
      print(e.toString());
  }
}

