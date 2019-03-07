import 'package:flutter/material.dart';

class MySlideDeleteApp extends StatelessWidget {
  static const String routeName = '/list/MySlideDeleteApp';
  final List<String> items =
      new List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final title = '滑动删除';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                items.removeAt(index);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              background: Container(color: Colors.red,),
              child: ListTile(title: Text("$item"),),
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
