import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_test_app/model/task.dart';

typedef void DeleteTaskAction();

class TodoItem extends StatelessWidget {
  final Task task;
  final ValueChanged<bool> checkBoxChangedCallback;
  final DeleteTaskAction deleteTaskAction;
  final Key key;

  const TodoItem(
      {this.key,
      this.task,
      this.checkBoxChangedCallback,
      this.deleteTaskAction})
      : super();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: this.key,
      onDismissed: (_) {
        deleteTaskAction();
      },
      child: ListTile(
        title: Text(
          task.name,
          style: TextStyle(
              decoration: task.isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing:
            Checkbox(value: task.isChecked, onChanged: checkBoxChangedCallback),
      ),
    );
  }
}
