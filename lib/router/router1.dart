import 'package:flutter/material.dart';

//页面传值
class Todo {
  final String title;
  final String decription;

  Todo(this.title, this.decription);
}

final todos = new List<Todo>.generate(
    20,
    (i) => new Todo(
          "todo $i",
          'A description of what needs to be done for Todo $i',
        ));

class TodosScreen extends StatelessWidget {
  List<Todo> todos = new List<Todo>.generate(20, (i)=>new Todo("todo $i", 'A description of what needs to be done for Todo $i', ));
  static const String routeName = '/router/TodosScreen';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          new DetailScreen(todo: todos[index])));
            },
          );
        },
        itemCount: todos.length,
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  const DetailScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${todo.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("${todo.decription}"),
      ),
    );
  }
}
