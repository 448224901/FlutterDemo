import 'dart:convert';

void main(){
  parsingJson();
}

void parsingJson(){
  //一个JSON格式的用户列表字符串
  var jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
  //将JSON字符串转为Dart对象(此处是List)
  var items = json.decode(jsonStr);
  print(items[0]['name']);
}