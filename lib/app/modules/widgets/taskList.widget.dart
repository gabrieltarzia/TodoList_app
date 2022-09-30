import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/app/modules/home/home.controller.dart';
import 'taskTile.widget.dart';

class TaskList {
  HomeController homeController = Get.put(HomeController());

  taskList() => Obx(() => homeController.todoController.taskList.isNotEmpty
      ? _filteredList()
      : const Center(
          child: Text('No tasks today :)'),
        ));

  _filteredList() => !homeController.isDone
      ? ListView.builder(
          itemCount: homeController.todoController.taskList.length,
          itemBuilder: (context, index) {
            if (!homeController.todoController.taskList[index].done) {
              return TaskTile()
                  .taskTile(homeController.todoController.taskList[index]);
            } else {
              return const Center();
            }
          })
      : ListView.builder(
          itemCount: homeController.todoController.taskList.length,
          itemBuilder: (BuildContext context, index) {
            return TaskTile()
                .taskTile(homeController.todoController.taskList[index]);
          });
}
