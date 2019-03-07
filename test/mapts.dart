main() {
  maptest();
}

void maptest() {
  Map<String, int> map = {"a": 1, "b": 2, "c": 3};
  print(map["a"]);

  List<int> list = [1, 2, 3];
  // 以下代码用到了速写语法，后面会详细讲解
  Map<String, int> map1 = new Map.fromIterable(list,
      key: (item) => item.toString(), value: (item) => item * item);
  // 1 + 4 = 5
  print(map1['1'] + map1['2']);
  // 9 - 4 = 5
  print(map1['3'] - map1['2']);

  List<String> letters = ['b', 'c'];
  List<String> words = ['bad', 'cat'];
  Map<String, String> map2 = new Map.fromIterables(letters, words);
  // bad + cat = badcat
  print(map2['b'] + map2['c']);

  Map<String, int> mapvalue = {"a": 1, "b": 2, "c": 3};
  // 返回映射的哈希码
  print(mapvalue.hashCode);
  // 映射上是否没有键值对
  print(mapvalue.isEmpty);
  // 映射上是否有键值对
  print(mapvalue.isNotEmpty);
  // 返回映射的所有键
  print(mapvalue.keys);
  // 返回映射的所有值
  print(mapvalue.values);
  // 返回映射上键值对的数目
  print(mapvalue.length);
  // 返回对象运行时的类型
  print(mapvalue.runtimeType);

//  常用方法
  Map<String, int> mapfun = {"a": 1, "b": 2, "c": 3};
  // 返回映射的字符串表示
  print(mapfun.toString());
  // 按顺序迭代映射
  mapfun.forEach((key, value){
    print(key + " : " + value.toString());
  });
  // 添加其他键值对到映射中
  mapfun.addAll({"d":4, "e":5});
  // 映射是否包含指定键
  print(mapfun.containsKey("d"));
  // 映射是否包含指定值
  print(mapfun.containsValue(5));
  // 删除指定键值对
  mapfun.remove("a");
  // 删除所有键值对
  mapfun.clear();

  Map<String, int> scores = {'Bob': 36};
  for (var key in ['Bob', 'Rohan', 'Sophena']) {
    // 查找指定键，如果不存在就添加
    scores.putIfAbsent(key, () => key.length);
  }
  print(scores['Bob']);
  print(scores['Rohan']);
  print(scores['Sophena']);
}

void settest(){
//  集的每个对象只能出现一次，不能重复
  Set villains = new Set();
  villains.add('Joker');
  villains.addAll( ['Lex Luther', 'Voldemort'] );
  print(villains);

//  所有属性
  Set villains1 = new Set.from(['Joker', 'Lex Luther', 'Voldemort']);
  // 返回第一个元素
  print(villains1.first);
  // 返回最后一个元素
  print(villains1.last);
  // 返回元素的数量
  print(villains1.length);
  // 集只有一个元素就返回元素，否则异常
  //print(villains.single);
  // 集是否没有元素
  print(villains1.isEmpty);
  // 集是否有元素
  print(villains1.isNotEmpty);
  // 返回集的哈希码
  print(villains1.hashCode);
  // 返回对象运行时的类型
  print(villains1.runtimeType);
  // 返回集的可迭代对象
  print(villains1.iterator);


//  常用方法
  Set villains2 = new Set.from(["A", "B", "C"]);
  // 添加一个值
  villains2.add("D");
  print(villains2);
  // 添加一些值
  villains2.addAll(["E", "F"]);
  print(villains2);
  // 以字符串输出集
  print(villains2.toString());
  // 将集的值用指定字符连接，以字符串输出
  print(villains2.join(","));
  // 集是否包含指定值
  print(villains2.contains("C"));
  // 集是否包含一些值
  print(villains2.containsAll(["E", "F"]));
  // 返回集的第几个值
  print(villains2.elementAt(1));
  // 删除集的指定值，成功则返回true
  print(villains2.remove("A"));
  // 删除集的一些值
  villains2.removeAll(["B", "C"]);
  // 删除集的所有值
  villains2.clear();
}
