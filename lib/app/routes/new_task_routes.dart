import 'package:get/get.dart';

import '../modules/new_task/new_task_binding.dart';
import '../modules/new_task/new_task_page.dart';

class NewTaskRoutes {
  NewTaskRoutes._();

  static const newTask = '/new-task';

  static final routes = [
    GetPage(
      name: newTask,
      page: NewTaskPage.new,
      binding: NewTaskBinding(),
    ),
  ];
}
