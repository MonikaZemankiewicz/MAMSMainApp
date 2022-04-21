import 'package:flutter/material.dart';
import 'package:secondlab/widgets/tasks_list.dart';
import 'package:secondlab/screens/add_task.dart';
import 'package:secondlab/models/task.dart';
import '../models/task_type.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [
    Task(
        name: "Task 1",
        description: "Dummy Data Description",
        dueDate: "21/05/2022",
        type: TaskType.Email,
        status: false),
    Task(
        name: "Task 2",
        description: "Dummy Data Description 2",
        dueDate: "30/06/2022",
        type: TaskType.Phone,
        status: false),
    Task(
        name: "Task 3",
        description: "Dummy Data Description 3",
        dueDate: "01/12/2022",
        type: TaskType.Meeting,
        status: false),
    Task(
        name: "Task 4",
        description: "Dummy Data Description 4",
        dueDate: "14/03/2023",
        type: TaskType.ToDo,
        status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My To-Do List',
        ),
      ),
      body: SafeArea(
        child: Container(color: Colors.white, child: TasksList(tasks: tasks)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTask(addTaskCallback: (Task newTask) {
              setState(() {
                tasks.add(newTask);
              });
            }),
            isScrollControlled: true,
          );
        },
      ),
    );
  }
}
