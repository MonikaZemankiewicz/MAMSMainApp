import 'package:flutter/material.dart';
import 'package:secondlab/models/place.dart';
import 'package:secondlab/screens/place_details.dart';
import 'package:secondlab/constants.dart';

class PlaceTile extends StatefulWidget {
  final Place place;

  const PlaceTile({required this.place});

  @override
  State<PlaceTile> createState() => _PlaceTileState();
}

class _PlaceTileState extends State<PlaceTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        widget.place.name,
        style: const TextStyle(
          color: kAccentColor,
        ),
      ),
      subtitle: Text(widget.place.address),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PlaceDetails(
            place: widget.place,
          );
        }));
      },
    );
  }
}
