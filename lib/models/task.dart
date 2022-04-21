import 'package:secondlab/models/task_type.dart';

class Task {
  final String name;
  final String description;
  bool status;
  TaskType type;
  String dueDate;

  Task(
      {this.name = "Default Name",
      this.description = "Default Description",
      this.dueDate = "No due date",
      this.status = false,
      this.type = TaskType.ToDo});

  void toggleDone() {
    status = !status;
  }
}
