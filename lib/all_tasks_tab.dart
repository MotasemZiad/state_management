import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'database_provider.dart';
import 'package:tababar/tasks_widget.dart';


class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: Provider.of<ProviderDatabase>(context)
              .dataList
              .where((element) =>
          element.isComplete == false || element.isComplete == true)
              .map((e) => TasksWidget(e))
              .toList()),
    );
  }
}

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: Provider.of<ProviderDatabase>(context)
              .dataList
              .where((element) => element.isComplete == true)
              .map((e) => TasksWidget(e))
              .toList()),
    );
  }
}

class InCompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          children: Provider.of<ProviderDatabase>(context)
              .dataList
              .where((element) => element.isComplete == false)
              .map((e) => TasksWidget(e))
              .toList()),
    );
  }
}
