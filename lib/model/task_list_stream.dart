import 'dart:convert';

import 'package:todo_test_app/model/task.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

abstract class TaskListData {
  Stream<List<Task>> get taskSteam;
}

abstract class TaskListDataActions {
  void addTask(Task task);

  void removeTask(int pos);

  void toggleTask(int pos);
}

class TaskListDataStream implements TaskListData, TaskListDataActions {
  StreamingSharedPreferences prefs;

  @override
  Stream<List<Task>> get taskSteam => prefs
      .getStringList("tasks", defaultValue: List())
      .map((listOfJsonString) => listOfJsonString
          .map((jsonString) => Task.fromMappedJson(jsonDecode(jsonString))));

  @override
  void addTask(Task task) {
    // TODO: implement addTask
  }

  @override
  void removeTask(int pos) {
    // TODO: implement removeTask
  }

  @override
  void toggleTask(int pos) {
    // TODO: implement toggleTask
  }

}
