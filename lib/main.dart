import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_app/data/task_data.dart';
import 'package:todo_test_app/model/task_list_data.dart';
import 'package:todo_test_app/screens/task_screen.dart';

import 'model/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskListStorage storage = TaskListStorageSharedPrefs();
    return ChangeNotifierProvider<TaskListDataNotifier>(
      builder: (context) => TaskListDataNotifier(List(), storage),
      child: FutureBuilder(
          future: storage.getTasks(),
          initialData: null,
          builder: (context, snpshot) {
            if(snpshot.data!=null)
              Provider.of<TaskListDataNotifier>(context).setTasks(snpshot.data);
            return MaterialApp(
              home: TaskScreen(),
            );
          }),
    );
  }
}
