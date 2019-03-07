main(){
//  listts();
  listtest2();
}

void listts(){
  //固定长度的列表，一旦定义就无法改变长度
  List<int> fixedLengthList = new List(5);
  fixedLengthList[0] = 87;
  print(fixedLengthList);
  print(fixedLengthList[0]);


//  可改变长度的列表，可以根据需要改变长度
  List<int> growableList = [1, 2];
  print(growableList);

  growableList.length = 0;
  print(growableList);

  growableList.add(499);
  print(growableList);

  growableList[0] = 87;
  print(growableList);

  // 创建可改变长度的列表
  List growableListA = new List();
  print(growableListA.length);
  growableListA.length = 3;
  print(growableListA.length);

  // 创建可在固定范围内改变长度的列表
  List growableListB = new List()..length = 500;


  // 创建包含所有元素的固定长度列表
  List fixedLengthListB = new List.unmodifiable([1, 2, 3]);
  print(fixedLengthListB.length);

  // 创建包含所有元素的可改变长度列表
  List growableListC = new List.from([1, 2, 3]);
  print(growableListC.length);
  growableListC.add(4);
  print(growableListC.length);

  // 为所有元素统一赋值
  List fixedLengthList1 = new List<int>.filled(3, 0);
  print(fixedLengthList1);

  // 用生成器给所有元素赋初始值
  List fixedLengthList2 = new List<int>.generate(4, (int index) {
    return index * index;
  });
  print(fixedLengthList2);
  // 返回第一个元素
  print(fixedLengthList2.first);
  // 返回最后一个元素
  print(fixedLengthList2.last);
  // 返回列表的哈希码
  print(fixedLengthList2.hashCode);
  // 列表是否为空
  print(fixedLengthList2.isEmpty);
  // 列表是否不为空
  print(fixedLengthList2.isNotEmpty);
  // 返回一个新的迭代器
  print(fixedLengthList2.iterator);
  // 列表中多少个元素
  print(fixedLengthList2.length);
  // 返回相反顺序的列表
  print(fixedLengthList2.reversed);
  // 返回对象运行时的类型
  print(fixedLengthList2.runtimeType);
  // 列表是否只有一个元素，则否报错
//  print(fixedLengthList2.single);


  List growableList1 = new List.from([1, 2, 3]);
  // 返回列表的字符串表示
  print(growableList1.toString());
  // 返回列表的集表示
  print(growableList1.toSet());
  // 返回列表的列表表示
  print(growableList1.toList());
  // 用指定字符连接列表元素
  print(growableList1.join(","));


  List growableList2 = new List();
  // 增加一个元素到列表末尾
  growableList2.add(10);
  print(growableList2);
  // 增加一个元素到指定下标
  growableList2.insert(1, 20);
  print(growableList2);
  // 增加一个列表到列表末尾
  growableList2.addAll([30, 60]);
  print(growableList2);
  // 增加一个列表到指定下标
  growableList2.insertAll(3, [40, 50]);
  print(growableList2);


  List growableList3 = new List.from([1, 2, 3, 3, 3, 4]);
  // 移除列表中匹配的第一个元素
  growableList3.remove(3);
  print(growableList3);
  // 移除列表中第几个元素
  growableList3.removeAt(0);
  print(growableList3);
  // 移除列表中最后一个元素
  growableList3.removeLast();
  print(growableList3);
  // 移除列表的所有元素
  growableList3.clear();
  print(growableList3);

  List<int> listB = [1, 2, 3, 4, 5];
  // 移除开始下标（不包括）至结束下标（包括）内的元素
  listB.removeRange(1, 4);
  print(listB);

  List<int> listA = [1, 2, 3, 4, 5];
  // 移除并替换开始下标（不包括）至结束下标（包括）内的元素
  listA.replaceRange(1, 4, [6, 7]);
  print(listA);

  List<String> numbersA = ['one', 'two', 'three', 'four'];
  /*  移除所有满足条件的元素，此为Dart的一种速写语法
        numbersA.removeWhere((item) => item.length == 3);   */
  numbersA.removeWhere((item){
    return item.length == 3;
  });
  print(numbersA);

  List<String> numbersB = ['one', 'two', 'three', 'four'];
  /*  移除所有不满足条件的元素，此为Dart的一种速写语法
        numbersB.retainWhere((item) => item.length == 3);   */
  numbersB.retainWhere((item){
    return item.length == 3;
  });
  print(numbersB);

  //按顺序迭代列表
  List<String> names = ["Alice", "Daphne", "Elizabeth", "Joanna"];
  names.forEach((name){
    print(name);
  });

  List<String> names1 = ['Abbey', 'Fallon', 'Xenia', 'Callie', 'Callie'];
  // 列表中是否包含指定元素
  print(names1.contains('Fallon'));
  // 返回列表中的第几个元素
  print(names1.elementAt(2));
  // 返回列表中第一个匹配元素的下标
  print(names1.indexOf('Callie'));
  // 返回列表中最后一个匹配元素的下标
  print(names1.lastIndexOf('Callie'));

  List<String> colors = ['red', 'green', 'blue', 'orange', 'pink'];
  // 返回从开始下标（包括）到结束下标（不包括）元素的列表
  print(colors.sublist(1, 3));
  // 返回从开始下标（包括）到最后一个元素的列表
  print(colors.sublist(1));
}


void listtest2(){
  List<String> listA = ['a', 'b', 'c'];
  // 从第几个元素开始覆盖原列表
  listA.setAll(1, ['bee', 'sea']);
  print(listA);

  List<int> listB = [1, 2, 3, 4, 5];
  // 对列表进行随机排序
  listB.shuffle();
  print(listB);

  List<int> listC = [1, 2, 3, 4, 5];
  // 对列表进行顺序排序
  listC.sort();
  print(listC);
}
