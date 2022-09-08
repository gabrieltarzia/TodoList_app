import 'package:get/get.dart';
import '../models/task_model.dart';

class LocalDatabase extends GetxController {
  var taskList = <TaskModel>[
    TaskModel(task: 'Sample Task 1', type: 'Task type', completed: false),
    TaskModel(task: 'Sample Task 2', type: 'Task type', completed: false),
  ].obs;
}
