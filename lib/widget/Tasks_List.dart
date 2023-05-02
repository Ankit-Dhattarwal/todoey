import 'package:flutter/material.dart';
import 'package:todoey/widget/Task_Tile.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        TaskTile(),
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}
