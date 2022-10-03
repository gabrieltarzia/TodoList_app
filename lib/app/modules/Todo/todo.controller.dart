import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/app/helper/const.helper.dart';
import '../Task/task.model.dart';

class TodoController extends GetxController {
  var taskList = <Task>[].obs;

  @override
  void onInit() {
    List? storedList = GetStorage().read<List>(ConstHelper.taskBox);

    if (storedList != null) {
      taskList = RxList(storedList.map((e) => Task.fromJson(e)).toList());
    }
    ever(taskList, (_) {
      GetStorage().write(ConstHelper.taskBox, taskList.toList());
    });
    super.onInit();
  }
}
