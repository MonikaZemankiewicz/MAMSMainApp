import 'package:flutter/material.dart';
import 'package:secondlab/widgets/event_tile.dart';
import 'package:secondlab/models/event.dart';
import 'package:secondlab/constants.dart';

class EventsList extends StatefulWidget {
  final List<Event> events;

  EventsList({Key? key, required this.events}) : super(key: key);

  @override
  State<EventsList> createState() => _TasksListState();
}

class _TasksListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          shadowColor: Color.fromARGB(100, 246, 242, 242),
          child: EventTile(
            event: widget.events[index],
          ),
        );
      },
      itemCount: widget.events.length,
    );
  }
}
