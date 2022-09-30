import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/app/modules/Todo/todo.controller.dart';

class HomeController extends GetxController {
  TodoController todoController = Get.put(TodoController());
  final box = GetStorage();

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  bool get isDone => box.read('done') ?? false;
  bool get done => isDone ? true : false;

  void changeDone(bool value) => box.write('done', value);
}
