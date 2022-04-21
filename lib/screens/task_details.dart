// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:secondlab/models/task.dart';
import 'package:secondlab/models/task_type.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({required this.task});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("To-do list"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(task.name),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(task.dueDate),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(task.type.toShortString()),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: task.status ? Text("Done") : Text("Not Done"),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(task.description),
              ),
            ),
          ],
        ));
  }
}
