import 'package:flutter/material.dart';
import 'package:todoey/widget/Task_Tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/TaskData.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}


class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return  Consumer<TaskData>(
      builder: (context , taskData, child){
        return ListView.builder(itemBuilder: (context, index){
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback : ( checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: (){
              taskData.deleteTask(task);
            },

          );
        },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}
