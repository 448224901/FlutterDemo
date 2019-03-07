/**
*表达式
**/

/**
*if~else
 **/
void iftest(){
//  if (isRaining()) {
//    you.bringRainCoat();
//  } else if (isSnowing()) {
//    you.wearJacket();
//  } else {
//    car.putTopDown();
//  }
}

/**
 * for
 */
void forts(){
  var message = new StringBuffer("Dart is fun");
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
//  使用forEach()方法迭代iteration对象
  List<String> names = ["Alice", "Daphne", "Elizabeth", "Joanna"];
  names.forEach((name){
    print(name);
  });
  //使用for~in迭代iteration对象的List类型和Set类型
  var collection = [0, 1, 2];
  for (var x in collection) {
    print(x);
  }
}

/**
 * while、do~while
 */

void whilets(){
//  while循环，先判断条件再进入循环
 /* while (!isDone()) {
    doSomething();
  }*/
//  do~while循环，先进入循环再判断条件
/*do {
    printLine();
} while (!atEndOfPage());*/
}

/**
*break、continue
 **/
void bcts(){
  //使用break停止循环
  /*while (true) {
    if (shutDownRequested()) break;
    processIncomingRequest();
  }*/
  //使用continue跳过本次循环
  /*
  * for (int i = 0;i < candidates.length;i++) {
    var candidate = candidates[i];
    if (candidate.yearsExperince < 5) {
        continue;
    }
    candidate.interview();
}
*/
}

/**
*switch、case
 **/
void scts(){
//  switch通常用于整数、字符串和编译时常量的比较，比较的对象必须是同一类型，每一个case必须用break结束
/*  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      executeClosed();
      break;
    case 'PENDING':
      executePending();
      break;
    case 'APPROVED':
      executeApproved();
      break;
    case 'DENIED':
      executeDenied();
      break;
    case 'OPEN':
      executeOpen();
      break;
    default:
      executeUnknown();
  }*/
//在case内容为空的情况下可以落空，或使用continue继续执行
 /* var command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      executeClosed();
      continue nowClosed;

    nowClosed:
    case 'NOW_CLOSED':
      executeNowClosed();
      break;
  }*/
}

/**
*assert
 * 使用assert语句，如果布尔值为false就扰乱正常运行，只在检查模式下生效
 **/
void assertts(){
//  //确保变量非空
//  assert(text != null);
//
////确保值小于100
//  assert(number < 100);
//
////确保这是一个https URL
//  assert(urlString.startsWith('https'));
}


// 这是一行注释
/*
    这是一大段注释
*/