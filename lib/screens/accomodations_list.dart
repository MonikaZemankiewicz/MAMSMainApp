import 'package:flutter/material.dart';
import 'package:secondlab/widgets/accomodation_tile.dart';
import 'package:secondlab/models/accomodation.dart';
import 'package:secondlab/constants.dart';

class AccomodationsList extends StatefulWidget {
  final List<Accomodation> accomodations;

  AccomodationsList({Key? key, required this.accomodations}) : super(key: key);

  @override
  State<AccomodationsList> createState() => _AccomodationsListState();
}

class _AccomodationsListState extends State<AccomodationsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          shadowColor: Color.fromARGB(100, 246, 242, 242),
          child: AccomodationTile(
            accomodation: widget.accomodations[index],
          ),
        );
      },
      itemCount: widget.accomodations.length,
    );
  }
}
