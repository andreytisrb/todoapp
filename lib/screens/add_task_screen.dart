import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_app/model/task.dart';
import 'package:todo_test_app/model/task_list_data.dart';

class AddTaskScreen extends StatelessWidget {
  String todoText = "";
  @override
  Widget build(BuildContext context) => Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 25,
                  ),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value){ todoText = value;},
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Colors.lightBlueAccent))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    final taskList = Provider.of<TaskListData>(context);
                    taskList
                        .addTask(Task(name: todoText, isChecked: false));
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      );
}
