import 'dart:math';
/**
 * 私有变量与函数
 * dart语法中没有public、protected和private这些关键字，只要在标识符前面加“_”，就能声明私有变量或者函数
 */

/**
 * 实例变量
 *声明实例变量时，所有未初始化的实例变量的值为null
 * */
class Point {
  int x;      // null
  int y;      // null
  int z = 0;  // 0
//  一个实例变量分配一个构造函数参数会使语法更简单
  Point(this.x, this.y);

  // 命名构造函数   使用命名构造函数让类有多个构造函数
  Point.fromJson(Map json) {
    x = json['x'];
    y = json['y'];
  }
}


/**
 * 父类的构造函数
 * 子类构造函数调用父类的默认构造函数，如果父类没有默认构造函数，必须手动调用父类的构造函数，在 : 号后面指定父类的构造函数
**/
//调用  var emp = new Employee.fromJson({});
class Person {
  Person.fromJson(Map data) {
    print("in Person");
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print("in Employye");
  }
}

/**
 * 初始化实例变量
 * 除了调用父类的构造函数，还可以在构造函数体运行之前初始化实例变量
**/
//调用 var emp = new Point1.fromJson({'x':5, 'y':6});
class Point1 {
  int x;
  int y;

  Point1(this.x, this.y);

  Point1.fromJson(Map jsonMap): x = jsonMap['x'], y = jsonMap['y'] {
    print("In Point.fromJson(): ($x, $y)");
  }
}

/**
 * 常量构造函数
 * 想让类生成的对象永远不会改变，可以让这些对象变成编译时常量，定义一个const构造函数并确保所有实例变量是final的
**/
//调用   var emp = new ImmutablePoint(7, 8);
class ImmutablePoint {
  final int x;
  final int y;
  const ImmutablePoint(this.x, this.y);
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

/**
 * 工厂构造函数
 * 使用factory关键字实现构造函数时，不一定要创建一个类的新实例，例如，一个工厂的构造函数可能从缓存中返回一个实例，或者返回一个子类的实例
**/
//调用 var logger = new Logger("UI");logger.log("Button clicked");

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

/**
 * 实例方法
 * 实例对象可以访问实例变量和方法
 */
//var point = new Point(12, 24);
class Point2 {
  int x;
  int y;
  Point2(this.x, this.y);

  int distanceTo(Point2 other) {
    int dx = x - other.x;
    int dy = y - other.y;
    return sqrt(dx * dx + dy * dy); // ignore: return_of_invalid_type
  }
}

/**
* getter和setter
 * getter和setter是特殊的方法，可以读写访问对象的属性，每个实例变量都有一个隐式的getter，适当的加上一个setter，可以通过实现getter和setter创建附加属性，使用get和set关键词
 * **/
class Rectangle {
  int left;
  int top;
  int width;
  int height;

  Rectangle(this.left, this.top, this.width, this.height);

  int get right => left + width;
  set right(int value) => left = value - width;
  int get botton => top + height;
  set botton(int value) => top = value - height;
}

/**
 * 抽象方法
 * 实例、getter和setter方法可以是抽象的，抽象方法使用分号 ; 而不是方法体
**/
abstract class Doer {
  //...定义实例变量和方法...

  //定义一个抽象方法
  void doSomething();
}

class EffectiveDoer extends Doer {
  void doSomething() {
    //...实现一个抽象方法...
  }
}

/**
 * 重写运算符
**/

class Vector {
  final int x;
  final int y;
  const Vector(this.x, this.y);

  // 重写 + (a+b)
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

  // 重写 - (a-b)
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}

/**
*抽象类
 * 使用abstract修饰符定义的抽象类不能被实例化，抽象类用于定义接口，常用于实现，抽象类里通常有抽象方法，有抽象方法的不一定是抽象类
 **/
abstract class AbstractContainer {
  //...定义构造函数,字段、方法...

  //抽象方法
  void updateChildren();
}


/**
*枚举类型
 * 枚举类型是一种特殊的类，用于表示一个固定数量的常量值，不能实例化，使用enum关键字声明一个枚举类型
 **/
//print(Color.red.index);     // 0
//print(Color.green.index);   // 1
// 获得枚举值的列表
//List<Color> colore = Color.values;
//print(colore[2]);   // Color.blue
// 在switch语句中使用枚举
//Color aColor = Color.blue;
/*switch(aColor) {
case Color.red:
print("Red as Roses!");
break;
case Color.green:
print("Green as grass!");
break;
default:
print(aColor);
}*/
enum Color {
  red,
  green,
  blue
}

/**
*扩展类
 * 使用with关键字后面跟着一个或多个扩展类名
 * 要实现扩展类，创建一个没有构造函数，没有父类调用的类
 **/
abstract class Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

/**
*类的变量和方法
 * 使用static关键字实现类的变量和方法
 **/
// print(Color.red.name);  // red
class Color1 {
  // 静态常量
  static const red = const Color1("red");
  // 不可变的实例变量
  final String name;
  // 构造常量函数
  const Color1(this.name);
}

/**
*静态方法
 * 静态方法即类方法，没有实例，因此无法通过实例访问
 **/
//var distance = Point.distanceBetween(a, b);
class Point3 {
  int x;
  int y;
  Point3(this.x, this.y);

  static int distanceBetween(Point3 a, Point3 b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy); // ignore: return_of_invalid_type
  }
}