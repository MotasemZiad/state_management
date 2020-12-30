import 'package:flutter/material.dart';
import 'package:tababar/new_task.dart';
import 'package:provider/provider.dart';
import 'all_tasks_tab.dart';
import 'database_provider.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  var i = 1;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  var index = 0;

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderDatabase>(context).getDataList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return NewTask();
                },
              ));
            }),
      ),
      appBar: AppBar(
        title: Text("My Tasks"),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              text: "All Task",
            ),
            Tab(
              text: "Complete Tasks",
            ),
            Tab(
              text: "InComplete Tasks",
            ),
          ],
          isScrollable: true,
        ),
      ),
      body: Column(children: [
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [AllTasks(), CompleteTasks(), InCompleteTasks()],
          ),
        ),
      ]),
    );
  }
}
