import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:secondlab/models/event.dart';
import 'package:secondlab/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(widget.event.name,
                          style: const TextStyle(
                            color: kAccentColor,
                            fontSize: 30.0,
                          )),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_pin,
                            color: Color(0xFFED92A2)),
                        const SizedBox(width: 20.0),
                        Text(widget.event.address,
                            style: const TextStyle(
                                color: Color(0xFFA294C2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        if (await canLaunch(widget.event.location)) {
                          await launch(widget.event.location);
                        } else {
                          throw "Couldn't launch Map";
                        }
                      },
                      child: Icon(Icons.near_me),
                    ),
                  ],
                ),
                widget.event.images.length != 0
                    ? CarouselSlider(
                        options: CarouselOptions(),
                        items: widget.event.images
                            .map((item) => Container(
                                  child: Center(
                                      child: Image.asset(item,
                                          fit: BoxFit.cover, width: 1000)),
                                ))
                            .toList(),
                      )
                    : Text('No images to display'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(widget.event.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
