import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/modules/Task/task.model.dart';
import '../home/home.controller.dart';

HomeController homeController = Get.put(HomeController());
final TextEditingController taskNameController = TextEditingController();
String? taskName;

PreferredSizeWidget CustomAppBar() => AppBar(
        title: _nameField(),
        centerTitle: false,
        leading: _addButton(),
        actions: [
          _toggleComplete(),
        ]);

_toggleComplete() => Row(
      children: [
        const Text('Show completed'),
        Switch(
            value: homeController.isDone,
            onChanged: (value) {
              homeController.changeDone(value);
            }),
      ],
    );

_nameField() => TextField(
      controller: taskNameController,
      onChanged: (text) {
        taskName = text;
      },
    );

_addButton() => IconButton(
    onPressed: () {
      if (taskNameController.text.isEmpty) {
        Get.snackbar('Empty field', 'Insert a task name');
      } else {
        _createTask();
      }
    },
    icon: const Icon(Icons.add));

_createTask() {
  final newTask = Task(
    title: taskName!,
    done: false,
  );
  homeController.todoController.taskList.add(newTask);
  _clearField(taskNameController, taskName);
}

_clearField(TextEditingController controller, String? field) {
  controller.clear();
  field = null;
}
