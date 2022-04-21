import 'package:flutter/material.dart';
import 'package:secondlab/models/task.dart';
import 'package:secondlab/screens/task_details.dart';
import 'package:secondlab/models/task_type.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function changeStatusCallback;

  const TaskTile({required this.task, required this.changeStatusCallback});

  getWidget() {
    if (task.type == TaskType.ToDo) {
      return const Icon(Icons.list);
    } else if (task.type == TaskType.Phone) {
      return const Icon(Icons.phone);
    } else if (task.type == TaskType.Email) {
      return const Icon(Icons.email);
    } else if (task.type == TaskType.Meeting) {
      return const Icon(Icons.meeting_room);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor:
          task.status ? Color.fromARGB(255, 168, 206, 125) : Colors.white,
      leading: getWidget(),
      title: Text(
        task.name,
        style: TextStyle(
            decoration: task.status ? TextDecoration.lineThrough : null),
      ),
      trailing: task.status
          ? const Icon(
              Icons.done,
              color: Colors.white,
            )
          : null,
      subtitle: Text(task.dueDate),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TaskDetails(
            task: task,
          );
        }));
      },
      //onTap: changeStatusCallback,
    );
  }
}
