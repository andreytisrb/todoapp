import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_app/model/task.dart';
import 'package:todo_test_app/model/task_list_data.dart';
import 'package:todo_test_app/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListDataNotifier>(
      builder: (context, taskListData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TodoItem(
              key: UniqueKey(),
              task: taskListData.taskList[index],
              checkBoxChangedCallback: (_) {
                taskListData.toggleTask(index);
              },
              deleteTaskAction: () {
                taskListData.removeTask(index);
              },
            );
          },
          itemCount: taskListData.taskList.length,
        );
      },
    );
  }
}
