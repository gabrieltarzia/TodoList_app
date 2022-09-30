import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/modules/Todo/todo.controller.dart';
import 'package:todolist/app/modules/widgets/appbar.widget.dart';
import 'package:todolist/app/modules/widgets/taskList.widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: TaskList().taskList());
  }
}
