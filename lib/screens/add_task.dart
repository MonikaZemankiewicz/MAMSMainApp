import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:secondlab/models/task.dart';
import 'package:secondlab/models/task_type.dart';

class AddTask extends StatefulWidget {
  final Function addTaskCallback;
  const AddTask({Key? key, required this.addTaskCallback}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    String currentTaskName = 'New Task';
    String currentTaskDescription = 'Default Description';
    String currentTaskDueDate =
        DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
    TaskType currentTaskType = TaskType.ToDo;

    final nameFieldText = TextEditingController();
    final descriptionFieldText = TextEditingController();

    void clearText() {
      nameFieldText.clear();
      descriptionFieldText.clear();
    }

    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Add Task',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                    )),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    currentTaskName = newText;
                  },
                  controller: nameFieldText,
                ),
                TextField(
                  onChanged: (newText) {
                    currentTaskDescription = newText;
                  },
                  controller: descriptionFieldText,
                ),
                SfDateRangePicker(
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    currentTaskDueDate =
                        DateFormat('dd/MM/yyyy').format(args.value).toString();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<TaskType>(
                      value: currentTaskType,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (TaskType? newValue) {
                        currentTaskType = newValue!;
                      },
                      items: TaskType.values.map((TaskType taskType) {
                        return DropdownMenuItem<TaskType>(
                            value: taskType,
                            child: Text(taskType.toShortString()));
                      }).toList()),
                ),
                InkWell(
                  onTap: () {
                    widget.addTaskCallback(Task(
                        name: currentTaskName,
                        description: currentTaskDescription,
                        dueDate: currentTaskDueDate,
                        type: currentTaskType,
                        status: false));
                    clearText();
                  },
                  child: Container(
                    color: Colors.blue,
                    margin: EdgeInsets.only(top: 30.0),
                    width: double.infinity,
                    height: 80.0,
                    alignment: Alignment.center,
                    child: const Text(
                      "ADD TASK",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
