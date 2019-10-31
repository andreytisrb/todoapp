import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'task.dart';

class TaskListData with ChangeNotifier {
  final List<Task> taskList = [
    Task(name: "task1", isChecked: true),
    Task(name: "task2", isChecked: false),
    Task(name: "task3", isChecked: false),
    Task(name: "task4", isChecked: false),
  ];

  undoneTasks() => taskList.where((t)=>!t.isChecked).length;
  void addTask(Task task) {
    taskList.add(task);
    notifyListeners();
  }

  void removeTask(int pos) {
    taskList.removeAt(pos);
    notifyListeners();
  }

  void updateTask(int pos, Task newTask) {
    taskList[pos] = newTask;
    notifyListeners();
  }

  void toggleTask(int pos){
    taskList[pos].toggle();
    notifyListeners();
  }
}
