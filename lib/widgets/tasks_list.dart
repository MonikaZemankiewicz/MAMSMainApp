import 'package:flutter/material.dart';
import 'package:secondlab/widgets/task_tile.dart';
import 'package:secondlab/models/task.dart';
import 'package:secondlab/widgets/slide_left_bcg.dart';
import 'package:secondlab/widgets/slide_right_bcg.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(index.toString()),
          child: TaskTile(
            task: widget.tasks[index],
          ),
          background: slideRightBcg(),
          secondaryBackground: slideLeftBcg(),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                          "Are you sure you want to delete ${widget.tasks[index].name}?"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.tasks.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            } else {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            }
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
