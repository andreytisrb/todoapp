import 'dart:convert';

import 'package:todo_test_app/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TaskListStorage {
  Future setTasks(List<Task> tasks);

  Future<List<Task>> getTasks();
}

class TaskListStorageSharedPrefs implements TaskListStorage {

  @override
  Future<List<Task>> getTasks() async {
    var prefs = await SharedPreferences.getInstance();
    var resultList = await prefs
        .getStringList("tasks")
        .map((it) => Task.fromMappedJson(jsonDecode(it)))
        .toList();
    return resultList;
  }

  @override
  Future setTasks(List<Task> tasks) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> tasksString = tasks.map((it) => jsonEncode(it.toJson())).toList();
    final res = await prefs
        .setStringList("tasks", tasksString);
    print(res);
  }
}
