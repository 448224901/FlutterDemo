import 'dart:math';

/**
 *库
 *Pub仓库 在根目录下pubspec.yaml文件
 */
main(){
  print(pi);
}

/**
 * 如果只需要使用库的一部分，可以选择性的导入
    //只导入foo
    import 'package:lib1/lib1.dart' show foo;

    //导入除了foo以外的所有
    import 'package:lib2/lib2.dart' hide foo;
 */

/**
 * 让程序延迟加载一个库时，延迟加载库，您必须使用deferred as，await 关键字暂停执行直到加载库，您可以多次使用loadLibrary()，库只加载一次
    import 'package:deferred/hello.dart' deferred as hello;

    // 当你需要使用库，使用 loadLibrary() 调用库
    greet() async {
    await hello.loadLibrary();
    hello.printGreeting();
    }
 */

/**
    首先创建mystorage.dart文件，声明mystorage库和需要的util.dart与tool.dart文件

    library mystorage;

    import "dart:math";

    part "util.dart";
    part "tool.dart";

    void printPi() => print(PI);
    1
    2
    3
    4
    5
    6
    7
    8
    创建util.dart文件供mystorage库使用

    part of mystorage;

    void printUtil() => print("Hello util.dart!");
    1
    2
    3
    创建tool.dart文件供mystorage库使用

    part of mystorage;

    void printTool() => print("Hello tool.dart!");
    1
    2
    3
    最后在主方法中调用mystorage库

    import "mystorage.dart";

    void main(){
    printUtil();
    printTool();
    printPi();
    }
 */

/**
 * 泛型
 * abstract class Cache<T> {
    T getByKey(String key);
    setByKey(String key, T value);
    }
*/

/**
 *  // 抛出一个异常
    throw new FormatException('Expected at least 1 section');

    // 抛出任意异常对象
    throw 'Out of llamas!';

    // 用=> statements在任何地方抛出任意异常
    distanceTo(Point other) => throw new UnimplementedError();

    Catch
    捕获异常并处理

    try {
    breedMoreLlamas();
    } on OutOfLlamasException {
    buyMoreLlamas();
    }

    Finally
    确保代码的运行，不管是否抛出异常，使用finally子句，无论是否有匹配异常的catch子句，最终都执行finally子句

    try {
    breedMoreLlamas();
    } finally {
    //总是执行，即使抛出异常
    cleanLiamaStalls();
    }
*/