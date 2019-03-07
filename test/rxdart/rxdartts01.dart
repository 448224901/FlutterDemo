import 'package:rxdart/rxdart.dart';
import 'dart:async';

void main(){
  test05();
}

/**
 * 从单个值中创建
    有时候API需要一个Stream/Observable，但是你的初始数据只是一个简单的值，这个时候你可以使用just工厂函数：
 */
test01(){
  var justObservable = Observable<int>.just(42);
  justObservable.listen(print);
}

/**
 * 从一个Stream中创建
    通过将任意Stream传给Observable的构造函数，就得到了一个Observable实例：
 */
test02(){
  var controller = StreamController<String>();
  controller.add("onNext");
  var streamObservable = Observable(controller.stream);
  streamObservable.listen(print);
}

test03(){

  var timerObservable = Observable.periodic(Duration(seconds: 1),(x)=>x.toString());
  timerObservable.listen(print);
}

test04(){
  Future<String> asyncFunction() async{
    return Future.delayed(Duration(seconds: 1),()=>'AsyncResult');
  }
  var observable = Observable.fromFuture(asyncFunction());
  observable.listen(print);
}

test05() async {
  var subject = PublishSubject<String>();
  subject.listen((item) =>print(item));
  subject.add("Item1");

  //添加第二个listen
  subject.listen((item)=>print(item.toUpperCase()));
  
  subject.add("Item2");
  subject.add("Item3");

  // 这句话只是为了防止在数据处理完毕之前，进程就被杀死了
  var future = await Future.delayed(Duration(seconds: 5));
  //运行结束之后调用
  future.then((x)=>print('hello'));
  // 取消所有的Subscriptions
  subject.close();
}