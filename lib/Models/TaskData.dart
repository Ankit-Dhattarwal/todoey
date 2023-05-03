import 'package:flutter/foundation.dart';
import 'package:todoey/Models/tasks.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  List<Task> _tasks =[
    Task(name: 'Buy Milk', isDone: false),
    Task(name: 'Buy bread', isDone: false),
    Task(name: 'Buy eggs', isDone: false),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}