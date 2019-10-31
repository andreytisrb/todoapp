import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_app/model/task_list_data.dart';
import 'package:todo_test_app/screens/add_task_screen.dart';
import 'package:todo_test_app/widgets/todo_list.dart';

class TaskScreen extends StatelessWidget {
  final taskListData = TaskListData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Todoey',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      Provider.of<TaskListData>(context).undoneTasks().toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ]),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: new TodoList(),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
