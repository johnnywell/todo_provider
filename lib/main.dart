import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/todo.dart';
import 'package:todo_provider/theme.dart';

import 'models/todolist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TodoList(),
      child: MaterialApp(
        title: 'Todo List',
        theme: appTheme,
        home: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoList>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // Counter(),
          Consumer<TodoList>(
            builder: (context, todoList, child) => Text(
              "${todoList.length}",
              style: Theme.of(context).textTheme.display1)
          )
        ],
        title: Text("Todo List with Provider"),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          var todo = todoList[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(todo.description),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart){
                todoList.remove(todo);
                print(todoList.length);
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("${todo.description} apagada")));
              } else if (direction == DismissDirection.startToEnd) {
                todoList.complete(todo);
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
