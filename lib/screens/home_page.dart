import 'package:flutter/material.dart';
import 'package:secondlab/models/accomodation.dart';
import 'package:secondlab/screens/events_list.dart';
import 'package:secondlab/screens/places_list.dart';
import 'package:secondlab/screens/accomodations_list.dart';
import 'package:secondlab/models/event.dart';
import 'package:secondlab/models/place.dart';
import 'package:secondlab/constants.dart';
import 'package:secondlab/data/data.dart';
import 'package:secondlab/screens/tours_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreenColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'images/mapicon.svg',
                color: Colors.white,
                height: 25,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text("Almeria Guide")
          ],
        ),
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.event)),
            Tab(icon: Icon(Icons.place)),
            Tab(icon: Icon(Icons.hotel)),
            Tab(icon: Icon(Icons.map)),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Container(color: kBcgColor, child: EventsList(events: events)),
          Container(color: kBcgColor, child: PlacesList(places: places)),
          Container(
              color: kBcgColor,
              child: AccomodationsList(accomodations: accomodations)),
          Container(color: kBcgColor, child: ToursList(tours: tours)),
        ],
      ),
    );
  }
}
