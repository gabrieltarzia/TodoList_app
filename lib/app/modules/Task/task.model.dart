import 'package:get/get.dart';

class Task {
  String title;
  bool done = false;

  Task({required this.title, required this.done});

  factory Task.fromJson(Map<String, dynamic> json) =>
      Task(title: json['title'], done: json['done']);

  Map<String, dynamic> toJson() => {'title': title, 'done': done};

  /* Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        done = json['done'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'done': done,
    };
  }*/
}
