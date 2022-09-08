import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/data/dataBase/local_database.dart';
import 'package:todolist/app/data/models/task_model.dart';
import 'package:todolist/app/modules/new_task/new_task_page.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final LocalDatabase dbController = Get.put(LocalDatabase());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: const Text('Just do it'),
          centerTitle: true,
        ),
        body: _taskList(dbController.taskList));
  }

  _taskList(List<TaskModel> taskList) => Padding(
        padding: const EdgeInsets.all(7),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Obx(() {
            return ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return _taskTile(taskList[index]);
                });
          }),
          ElevatedButton(
            onPressed: () {
              Get.to(NewTaskPage());
            },
            child: const Text(
              'New task',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 50),
                backgroundColor: Colors.deepOrange),
          ),
        ]),
      );

  _taskTile(TaskModel task) => Padding(
      padding: const EdgeInsets.all(7),
      child: (Obx(() {
        return ListTile(
          title: Text(
            task.task.toString(),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            task.type.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          tileColor: task.completed.value ? Colors.green : Colors.grey,
          leading: _checkBox(task),
          trailing: _deleteButton(task),
        );
      })));

  _checkBox(TaskModel task) => Obx(() {
        return Checkbox(
            value: task.completed.value,
            onChanged: (value) {
              task.completed.value = !task.completed.value;
            });
      });

  _deleteButton(TaskModel task) => IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        dbController.taskList.remove(task);
      });
}
