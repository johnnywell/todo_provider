class Todo {
  String description;
  bool _done;

  Todo(this.description);

  get done => _done;

  void complete() => _done = true;

}