import'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final VoidCallback? longPressCallback;

  TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback, required this.longPressCallback});


  // void checkboxCallback (bool checkboxState){
  // setState(() {
  //   isChecked = checkboxState;
  // });
  // }
  //
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onLongPress: longPressCallback,
      title: Text(taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue){
          checkboxCallback(newValue);
      },
      //  onChanged: checkboxCallback,
      ),
    );
  }
}
