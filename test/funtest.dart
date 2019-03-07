main() {}

// 规范语法
void printNameA(String name) {
  print("My name is $name.");
}

// 通俗语法
printNameB(name) {
  print("My name is $name.");
}

// 速写语法
void printNameC(String name) => print("My name is $name.");

//可选参数  命名参数
// 用 { } 把参数包装起来，就能标识命名参数
// 用 : 指定默认值
//调用: printName(name:"XiaoMing", age:14);
void printName({String name, int age, String sex: "female"}) {
  print("My name is $name, $age years old, gender $sex.");
}

/**
 * 位置参数
 * 调用:print(say("Bob", "Howdy")); print(say("Bob", "Howdy", "smoke signal"));
 */
String say(String from, String msg, [String device, String mood = "good"]) {
  String result = "$from says $msg.";
  if (device != null) {
    result = "$result with a $device.";
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

/**
 * 高阶函数
 * 将函数作为参数传递给另一个函数
 */
//调用 List list = [1, 2, 3];list.forEach(printElement);
printElement(element) {
  print(element);
}

//将一个函数分配给一个变量
funTest() {
  var loudify = (msg) => "!!! ${msg.toUpperCase()} !!!";
  print(loudify("hello"));
}

/**
 * 闭包:dart的闭包就是函数对象，其实跟JavaScript的闭包函数差不多
 */
void test() {
  // 创建一个函数add2，返回加2
  Function add2 = makeAdder(2);
  // 创建一个函数add4，返回加4
  Function add4 = makeAdder(4);

  // 2 + 3 = 5
  print(add2(3));
  // 4 + 3 = 7
  print(add4(3));
}

// 返回一个函数对象，功能是返回累加的数字
Function makeAdder(int add) {
  return (int i) => add + i;
}

/**
 * 函数判断
 */
void test2() {
  var x;

  // 比较高阶函数
  x = foo;
  print(foo == x);

  // 比较静态方法
  x = SomeClass.bar;
  print(SomeClass.bar == x);

  // 比较实例方法
  var v = new SomeClass();
  var w = new SomeClass();
  var y = w;
  x = w.baz;
  print(y.baz == x);
  print(v.baz != w.baz);
}

// 一个高阶函数
foo(){}

class SomeClass{
  // 一个静态方法
  static void bar(){}
  // 一个实例方法
  void baz(){}
}

/**
 * 类型运算符
 */
//用as、is和is!可以很方便的在执行时检查类型
//用 obj is T 这个语法可以判断obj是否实现了T
