import 'package:flutter/material.dart';
import 'package:secondlab/models/task.dart';
import 'package:secondlab/models/task_type.dart';
import 'package:secondlab/constants.dart';

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({required this.task});

  getWidget() {
    if (task.type == TaskType.ToDo) {
      return const Icon(Icons.list, color: Colors.white);
    } else if (task.type == TaskType.Phone) {
      return const Icon(Icons.phone, color: Colors.white);
    } else if (task.type == TaskType.Email) {
      return const Icon(Icons.email, color: Colors.white);
    } else if (task.type == TaskType.Meeting) {
      return const Icon(Icons.handshake, color: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
          automaticallyImplyLeading: true,
          title: const Text("TODOS"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(100.0),
                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(task.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(task.dueDate,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getWidget(),
                          Text(task.type.toShortString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          task.status
                              ? const Icon(Icons.circle, color: kGreenColor)
                              : const Icon(Icons.circle, color: kYellowColor),
                          task.status
                              ? const Text("Done",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ))
                              : const Text("Not Done",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(task.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          )),
                    ),
                  ],
                )),
          ],
        ));
  }
}
