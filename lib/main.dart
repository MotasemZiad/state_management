import 'package:flutter/material.dart';
import 'package:tababar/TabBarPage.dart';
import 'package:tababar/db_helper.dart';
import 'package:provider/provider.dart';
import 'database_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper.myDatabase.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderDatabase(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        //darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: TabBarPage(),
      ),
    );
  }
}
