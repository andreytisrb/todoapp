import 'package:flutter/cupertino.dart';
import 'package:todo_test_app/data/task_data.dart';
import 'task.dart';

class TaskListDataNotifier with ChangeNotifier {
  final List<Task> taskList;
  final TaskListStorage taskStorage;

  TaskListDataNotifier(this.taskList, this.taskStorage);

  get undoneTasks => taskList.where((t)=>!t.isChecked).length;

  Future setTasks(List<Task> tasks){
    taskList.clear();
    taskList.addAll(tasks);
    notifyListeners();
  }

  Future addTask(Task task) async {
    taskList.add(task);
    notifyListeners();
    await taskStorage.setTasks(taskList);
  }

  Future removeTask(int pos) async {
    taskList.removeAt(pos);
    notifyListeners();
    await taskStorage.setTasks(taskList);
  }

  Future updateTask(int pos, Task newTask) async {
    taskList[pos] = newTask;
    notifyListeners();
    await taskStorage.setTasks(taskList);
  }

  Future toggleTask(int pos) async {
    taskList[pos].toggle();
    notifyListeners();
    await taskStorage.setTasks(taskList);
  }
}
