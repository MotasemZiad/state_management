import 'package:flutter/cupertino.dart';
import 'package:tababar/task_model.dart';

import 'db_helper.dart';

class ProviderDatabase extends ChangeNotifier {
  List<Task> dataList = List();

  Future getDataList() async {
    List<Task> newDataList = List();
    await DBHelper.myDatabase
        .getAllTask()
        .then((value) => value.forEach((element) {
      newDataList.add(Task.fromMap(element));
    }))
        .whenComplete(() => dataList.clear())
        .whenComplete(() => dataList.addAll(newDataList))
        .whenComplete(() => this.notifyListeners());
  }

  updateTask(Task taskModel) async {
    await DBHelper.myDatabase
        .updateTask(taskModel)
        .whenComplete(() => this.notifyListeners())
        .whenComplete(() => getDataList());
  }

  deleteTask(int id) async {
    await DBHelper.myDatabase.deleteTask(id);
    getDataList();
  }

  Future insertTask(Task task) async {
    await DBHelper.myDatabase.insertTask(task);
    getDataList();
  }
}