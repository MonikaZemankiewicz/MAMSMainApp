import 'package:flutter/material.dart';
import 'package:secondlab/widgets/place_tile.dart';
import 'package:secondlab/models/place.dart';
import 'package:secondlab/constants.dart';

class PlacesList extends StatefulWidget {
  final List<Place> places;

  PlacesList({Key? key, required this.places}) : super(key: key);

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          shadowColor: Color.fromARGB(100, 246, 242, 242),
          child: PlaceTile(
            place: widget.places[index],
          ),
        );
      },
      itemCount: widget.places.length,
    );
  }
}
