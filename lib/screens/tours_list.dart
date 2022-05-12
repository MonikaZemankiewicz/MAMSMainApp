import 'package:flutter/material.dart';
import 'package:secondlab/widgets/tour_tile.dart';
import 'package:secondlab/models/tour.dart';
import 'package:secondlab/constants.dart';

class ToursList extends StatefulWidget {
  final List<Tour> tours;

  ToursList({Key? key, required this.tours}) : super(key: key);

  @override
  State<ToursList> createState() => _ToursListState();
}

class _ToursListState extends State<ToursList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          shadowColor: Color.fromARGB(100, 246, 242, 242),
          child: TourTile(
            tour: widget.tours[index],
          ),
        );
      },
      itemCount: widget.tours.length,
    );
  }
}
