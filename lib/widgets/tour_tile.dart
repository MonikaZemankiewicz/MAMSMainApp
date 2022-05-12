import 'package:flutter/material.dart';
import 'package:secondlab/models/tour.dart';
import 'package:secondlab/constants.dart';
import 'package:secondlab/screens/tour_details.dart';

class TourTile extends StatefulWidget {
  final Tour tour;

  const TourTile({required this.tour});

  @override
  State<TourTile> createState() => _TourTileState();
}

class _TourTileState extends State<TourTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        widget.tour.name,
        style: const TextStyle(
          color: kAccentColor,
        ),
      ),
      subtitle: Text('Click for more details'),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TourDetails(
            tour: widget.tour,
          );
        }));
      },
    );
  }
}
