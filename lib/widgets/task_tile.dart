import 'package:flutter/material.dart';
import 'package:secondlab/models/task.dart';
import 'package:secondlab/screens/task_details.dart';
import 'package:secondlab/models/task_type.dart';

class TaskTile extends StatefulWidget {
  final Task task;

  const TaskTile({required this.task});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  getWidget() {
    if (widget.task.type == TaskType.ToDo) {
      return const Icon(Icons.list, color: Colors.blue);
    } else if (widget.task.type == TaskType.Phone) {
      return const Icon(Icons.phone, color: Colors.blue);
    } else if (widget.task.type == TaskType.Email) {
      return const Icon(Icons.email, color: Colors.blue);
    } else if (widget.task.type == TaskType.Meeting) {
      return const Icon(Icons.meeting_room, color: Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: widget.task.status
          ? Color.fromARGB(255, 168, 206, 125)
          : Colors.white,
      leading: getWidget(),
      title: Text(
        widget.task.name,
        style: TextStyle(
            decoration: widget.task.status ? TextDecoration.lineThrough : null),
      ),
      trailing: widget.task.status
          ? const Icon(
              Icons.done,
              color: Color.fromRGBO(51, 219, 174, 1),
            )
          : null,
      subtitle: Text(widget.task.dueDate),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TaskDetails(
            task: widget.task,
          );
        }));
      },
    );
  }
}
