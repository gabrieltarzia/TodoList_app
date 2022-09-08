import 'package:get/get.dart';

import '../../data/dataBase/local_database.dart';
import '../../data/models/task_model.dart';

class NewTaskController extends GetxController {
  RxList<TaskModel> taskList = LocalDatabase().taskList;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
