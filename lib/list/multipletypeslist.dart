import 'package:flutter/material.dart';

void main() {
  runApp(new MyListApp(
//    items: new List<ListItem>.generate(
//      1000,
//      (i) => i % 6 == 0
//          ? new HeadingItem("heading $i")
//          : new MessageItem("sender $i", "Message body $i"),
//    ),
  ));
}

class MyListApp extends StatelessWidget {
  static const String routeName = '/list/multipletypeslist';
  final List<ListItem> items = new List<ListItem>.generate(
    1000,
    (i) => i % 6 == 0
        ? new HeadingItem("heading $i")
        : new MessageItem("sender $i", "Message body $i"),
  );

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final item = items[index];
            if (item is HeadingItem) {
              return ListTile(
                title: Text(
                  item.heading,
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            } else if (item is MessageItem) {
              return ListTile(
                title: Text(item.sender),
                subtitle: Text(item.body),
              );
            }
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
