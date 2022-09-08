import 'package:get/get.dart';

class TaskModel {
  String? task;
  String? type;
  final completed = false.obs;

  TaskModel({this.task, this.type, completed});
}
