import 'package:flutter/material.dart';
import 'package:todo_provider/theme.dart';

import 'models/todolist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: appTheme,
      home: MyHomePage(title: 'Todo List with Providers'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todoList = TodoList();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          var todo = todoList[index];
          return Dismissible(
            key: Key(todo.description),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart){
                setState(() {
                  todoList.remove(todo);
                });
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("${todo.description} apagada")));
              } else if (direction == DismissDirection.startToEnd) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("${todo.description} concluída")));
              }
            },
            movementDuration: Duration(milliseconds: 500),
            resizeDuration: Duration(milliseconds: 400),
            background: Card(
              color: Color(0xff4cbf99), 
              child: Container(
                child: Icon(Icons.check_circle),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30.0))),
            secondaryBackground: Card(
              color: Color(0xfff07171), 
              child: Container(
                child: Icon(Icons.delete),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 30.0))),
            child: Card(
              child: InkWell(
                child: ListTile(
                  title: Text("${todo.description}"),
                )
              )
            )
          );
          }
        ),
    );
  }
}
