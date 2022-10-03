import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/modules/home/home.controller.dart';
import '../Task/task.model.dart';

class TaskTile {
  final HomeController homeController = Get.put(HomeController());

  taskTile(Task task) => ListTile(
        title: Text(task.title),
        subtitle: Text(task.createdAt),
        tileColor: task.done ? Colors.green : Colors.grey.shade600,
        leading: _checkBox(task),
        trailing: _deleteButton(task),
      );

  _checkBox(Task task) => Checkbox(
      value: homeController.todoController
          .taskList[homeController.todoController.taskList.indexOf(task)].done,
      onChanged: (value) {
        var thisTask = homeController.todoController
            .taskList[homeController.todoController.taskList.indexOf(task)];
        thisTask.done = value!;
        homeController.todoController.taskList[
            homeController.todoController.taskList.indexOf(task)] = thisTask;
      });

  _deleteButton(Task task) => IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        homeController.todoController.taskList.remove(task);
      });
}
