import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/app/modules/home/home.view.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  await GetStorage.init();
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (_) {
      return MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
      );
    });
  }
}
