import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tababar/task_model.dart';
import 'package:provider/provider.dart';
import 'database_provider.dart';
import 'db_helper.dart';
import 'deleteItem.dart';

class TasksWidget extends StatelessWidget {
  Task task;

  TasksWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  // _alertDialog(context);
                  deleteItem(context, task).then((value) {
                    Provider.of<ProviderDatabase>(context).deleteTask(task.id);
                  });
                }),
            Text(this.task.taskName),
            Checkbox(
                value: task.isComplete,
                onChanged: (value) {
                  this.task.isComplete = value;
                  Provider.of<ProviderDatabase>(context, listen: false)
                      .updateTask(this.task);
                })
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _alertDialog(BuildContext context) {
    final alertDialog = AlertDialog(
      title: Text('Alert'),
      content: Text('Do you really want ot delete this item?'),
      actions: [
        FlatButton(
            onPressed: () {
              DBHelper.myDatabase.deleteTask(task.id);
              Navigator.pop(context);
              _showSnackBar(context, 'Task deleted successfully');
            },
            child: Text('Yes')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('No')),
      ],
      elevation: 6,
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog,
    );
  }
}
