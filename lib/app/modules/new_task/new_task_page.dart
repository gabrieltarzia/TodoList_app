import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/data/dataBase/local_database.dart';
import '../../data/models/task_model.dart';
import 'new_task_controller.dart';

class NewTaskPage extends GetView<NewTaskController> {
  NewTaskPage({Key? key}) : super(key: key);
  final LocalDatabase dbController = Get.put(LocalDatabase());
  final nameController = TextEditingController();
  final typeController = TextEditingController();

  String? newTaskName;
  String? newTaskType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text('New Task'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_taskNameField(), _taskTypeField(), _taskAddButton()],
      ),
    );
  }

  _taskNameField() => Padding(
      padding: const EdgeInsets.all(7),
      child: TextField(
          controller: nameController,
          onChanged: (text) {
            newTaskName = text;
          },
          decoration: const InputDecoration(
              labelText: 'Task Name', border: OutlineInputBorder())));

  _taskTypeField() => Padding(
      padding: const EdgeInsets.all(7),
      child: TextField(
          controller: typeController,
          onChanged: (text) {
            newTaskType = text;
          },
          decoration: const InputDecoration(
              labelText: 'Task Type', border: OutlineInputBorder())));

  _taskAddButton() => Padding(
        padding: const EdgeInsets.all(7),
        child: ElevatedButton(
          onPressed: () {
            if (newTaskName!.length > 2 && newTaskType!.length > 2) {
              dbController.taskList.add(TaskModel(
                  task: newTaskName, type: newTaskType, completed: false));
              _clearField(nameController, newTaskName);
              _clearField(typeController, newTaskType);
            }
          },
          child: const Text(
            'Add to list',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(150, 50),
              backgroundColor: Colors.deepOrange),
        ),
      );

  _clearField(TextEditingController controller, String? field) {
    controller.clear();
    field = '';
  }
}
