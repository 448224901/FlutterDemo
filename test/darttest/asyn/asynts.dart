import 'dart:async';

void main(){
  printDailyNewsDigest02();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}
printDailyNewsDigest02() async {
  String news = await gatherNewsReports();
  print(news);
}


//异步调用
Future<void> printDailyNewsDigest() async{
  const news = '<gathered news goes here>';
  Duration oneSecond = Duration(seconds: 1);

//一秒之后执行
  Future<String> gatherNewsReports()=>Stream.periodic(oneSecond,(_)=>news).first;

  final future = gatherNewsReports();
  return future.then(print);
}

const news = '<gathered news goes here>';
Duration oneSecond = const Duration(seconds: 1);

final newsStream = new Stream.periodic(oneSecond, (_) => news);

// Imagine that this function is more complex and slow. :)
Future gatherNewsReports() => newsStream.first;

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}
