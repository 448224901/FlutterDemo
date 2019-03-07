import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PickerWidget extends StatefulWidget {
  @override
  PickerWidgetState createState() => new PickerWidgetState();
}

class PickerWidgetState extends State<PickerWidget> {
  List<String> titles = [
    'Picker',
    'DayPicker',
    'MonthPicker',
    'YearPicker',
    'CupertinoPicker',
    'CupertinoDatePicker',
    'CupertinoTimerPicker',
  ];

  List<String> subtitles = [
    '日期选择器',
    '日期选择器, 只能选择天',
    '日期选择器, 可以切换月份',
    '年份选择器',
    'iOS风格的选择器',
    'iOS风格的日期选择器',
    'iOS风格的倒数计时器选择器',
  ];

  DateTime dayPicker = DateTime.now();
  Duration m = Duration(minutes: 1);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Picker'),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            title: Text(titles[index]),
            subtitle: Text(subtitles[index]),
            onTap: () {
              switch (index) {
                case 0:
                  showDatePicker(
                    locale: Locale('zh'),//显示中文
                    context: context,
                    initialDate: DateTime.now(), // 当前日期
                    firstDate: DateTime.utc(1990, 1, 1), // 最小日期
                    lastDate: DateTime.utc(2100, 12, 31),
                  ); // 最大日期
                  break;
                case 1:
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      // 这里就不判断闰年平年 一个大小月
                      return DayPicker(
                          selectedDate: dayPicker,
                          currentDate: DateTime.now(),
                          onChanged: (time) {
                            Navigator.of(context).pop();
                            setState(() {
                              dayPicker = time;
                            });
                          },
                          firstDate: DateTime.utc(
                            DateTime.now().year,
                            DateTime.now().month,
                            3,
                          ),
                          // 最小日期
                          lastDate: DateTime.utc(
                            DateTime.now().year,
                            DateTime.now().month,
                            22,
                          ),
                          selectableDayPredicate: (time) {
                            return true;
                          },
                          // 限制选择区域
                          displayedMonth: DateTime.now());
                    },
                  );
                  break;
                case 2:
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return MonthPicker(
                        selectedDate: dayPicker,
                        onChanged: (time) {
                          Navigator.of(context).pop();
                          setState(() {
                            dayPicker = time;
                          });
                        },
                        firstDate: DateTime.utc(2000, 1),
                        lastDate: DateTime.utc(2100, 12),
                      );
                    },
                  );
                  break;
                case 3:
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return YearPicker(
                        selectedDate: dayPicker,
                        onChanged: (time) {
                          Navigator.of(context).pop();
                          setState(() {
                            dayPicker = time;
                          });
                        },
                        firstDate: DateTime.utc(2000, 1),
                        lastDate: DateTime.utc(2100, 12),
                      );
                    },
                  );
                  break;
                case 4:
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CupertinoPicker(
                        itemExtent: 40.0,
                        onSelectedItemChanged: (index) {},
                        diameterRatio: 360.0,
                        // 滚筒的曲率,就是弯曲的程度
                        useMagnifier: true,
                        magnification: 1.0,
                        looping: true,
                        backgroundColor: Colors.greenAccent,
                        offAxisFraction: 100.0,
                        // 子项的偏移
                        children: [
                          Text('Item 1'),
                          Text('Item 2'),
                          Text('Item 3'),
                          Text('Item 4'),
                          Text('Item 5'),
                          Text('Item 6'),
                          Text('Item 7'),
                          Text('Item 8'),
                          Text('Item 9'),
                          Text('Item 10'),
                        ],
                      );
                    },
                  );
                  break;
                case 5:
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        minimumYear: 1900,
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (time) {
                          setState(() {
                            dayPicker = time;
                          });
                        },
                      );
                    },
                  );
                  break;
                case 6:
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CupertinoTimerPicker(
                        onTimerDurationChanged: (duration) {
                        },
                        initialTimerDuration: m,
                      );
                    },
                  );
                  break;
              }
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(PickerWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}