import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_provider/models/todo.dart';


class TodoList with ChangeNotifier {
  final _todos = List<Todo>.generate(15, (i) => Todo("Tarefa $i"));

  int get length => _todos.length;

  set length(int newLength) {
    _todos.length = newLength;
  }

  Todo operator [](int index) => _todos[index];

  void operator []=(int index, Todo value) => _todos[index] = value;

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void remove(Todo todo) => _todos.remove(todo);

  void completeTodo(int todoId) {
    Todo todo = _todos[todoId];
    todo.complete();
    notifyListeners();
  }
}