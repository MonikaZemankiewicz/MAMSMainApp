import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:secondlab/models/event.dart';
import 'package:secondlab/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:secondlab/widgets/basic_details_panel.dart';

class EventDetails extends StatefulWidget {
  final Event event;
  const EventDetails({required this.event});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          automaticallyImplyLeading: true,
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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: BasicDetailsPanel(
              name: widget.event.name,
              address: widget.event.address,
              location: widget.event.location,
              images: widget.event.images,
              description: widget.event.description,
            ),
          ),
        ));
  }
}
