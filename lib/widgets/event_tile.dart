import 'package:flutter/material.dart';
import 'package:secondlab/models/event.dart';
import 'package:secondlab/constants.dart';
import 'package:secondlab/screens/event_details.dart';

class EventTile extends StatefulWidget {
  final Event event;

  const EventTile({required this.event});

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        widget.event.name,
        style: const TextStyle(
          color: kAccentColor,
        ),
      ),
      subtitle: Text(widget.event.address),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EventDetails(
            event: widget.event,
          );
        }));
      },
    );
  }
}
