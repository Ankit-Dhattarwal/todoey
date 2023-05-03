import 'package:flutter/material.dart';
import 'package:todoey/screen/add_task.dart';
import 'package:todoey/widget/Tasks_List.dart';
import 'package:todoey/screen/add_task.dart';
import 'package:todoey/Models/tasks.dart';

class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks =[
    Task(name: 'Buy Milk', isDone: false),
    Task(name: 'Buy bread', isDone: false),
    Task(name: 'Buy eggs', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context,
              builder: (context) => AddTaskScreen
                ( (newTaskTitle){
                 setState(() {
                   tasks.add(Task(name: newTaskTitle, isDone: false));
                 });
                 /*
                 The use of the navigator then when click on the add
                 button then auto close the sheet .
                  */
                 Navigator.pop(context);
              }

          ));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),),
                Text('12 tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: TasksList(tasks),
            ),
          ),
        ],
      ),
    );
  }
}
