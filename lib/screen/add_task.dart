import 'package:flutter/material.dart';
import 'package:todoey/Models/tasks.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/TaskData.dart';

class AddTaskScreen extends StatelessWidget {
   late String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
            ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),
            ElevatedButton(
                onPressed: (){
                  // final task = Task(name: newTaskTitle, isDone: false);
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);

                  Navigator.pop(context);
                },
                child: Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}
