import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_app/model/task_list_data.dart';
import 'package:todo_test_app/screens/task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final taskListData = TaskListData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListData>(
      builder: (context) => taskListData,
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }

}
