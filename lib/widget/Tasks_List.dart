import 'package:flutter/material.dart';
import 'package:todoey/widget/Task_Tile.dart';
import 'package:todoey/Models/tasks.dart';

class TasksList extends StatefulWidget {

  final List<Task> tasks;
  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}


class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (context, index){
      return TaskTile(
        taskTitle: widget.tasks[index].name,
        isChecked: widget.tasks[index].isDone,
        checkboxCallback : ( checkboxState) {
          setState(() {
            widget.tasks[index].toggleDone();
          });
        }

      );
    },
      itemCount: widget.tasks.length,
    );
  }
}
