class Task {
  String title;
  String createdAt;
  bool done = false;

  Task({required this.title,required this.createdAt, required this.done});

  factory Task.fromJson(Map<String, dynamic> json) =>
      Task(title: json['title'],createdAt: json['createdAt'], done: json['done']);

  Map<String, dynamic> toJson() => {'title': title,'createdAt': createdAt, 'done': done};

}
