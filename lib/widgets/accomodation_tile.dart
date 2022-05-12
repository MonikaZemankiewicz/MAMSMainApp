import 'package:flutter/material.dart';
import 'package:secondlab/models/accomodation.dart';
import 'package:secondlab/constants.dart';
import 'package:secondlab/screens/accomodation_details.dart';

class AccomodationTile extends StatefulWidget {
  final Accomodation accomodation;

  const AccomodationTile({required this.accomodation});

  @override
  State<AccomodationTile> createState() => _AccomodationTileState();
}

class _AccomodationTileState extends State<AccomodationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        widget.accomodation.name,
        style: const TextStyle(
          color: kAccentColor,
        ),
      ),
      subtitle: Text(widget.accomodation.address),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AccomodationDetails(
            accomodation: widget.accomodation,
          );
        }));
      },
    );
  }
}
