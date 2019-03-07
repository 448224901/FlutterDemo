main() async {
//  await futureTs();
  await futureWaitTs();
// await streamTs();
  print('hello');
}

futureTs() async {
  await Future.delayed(Duration(seconds: 2), () {
    return 'hi world!';
  }).then((date) {
    print(date);
  }).catchError((e) {
    print(e);
  }).whenComplete(() {
    //无论成功或失败都会走到这里
    print('无论成功或失败都会走到这里');
  });
}

futureWaitTs() async {
 await Future.wait(//2秒后返回结果
      [
    Future.delayed(Duration(seconds: 2), () {
      return 'hello';
    }),
    Future.delayed(Duration(seconds: 4), () {
      return 'world';
    }),
  ]).then((results) {
    print(results[0] + results[1]);
  }).catchError((e) {
    print(e);
  });
}
streamTs() async*{
  Stream.fromFutures([
    Future.delayed(Duration(seconds: 1),(){
      return 'hello 1';
    }),
    Future.delayed(Duration(seconds: 2),(){
      throw AssertionError('Error');
    }),
    Future.delayed(Duration(seconds: 3),(){
      return 'hello 3';
    })
  ]).listen((data){
    print(data);
  },onError:(e){
      print(e.message);
  },onDone: (){

  });
}