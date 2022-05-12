import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:secondlab/models/accomodation.dart';
import 'package:secondlab/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AccomodationDetails extends StatefulWidget {
  final Accomodation accomodation;
  const AccomodationDetails({required this.accomodation});

  @override
  State<AccomodationDetails> createState() => _AccomodationDetailsState();
}

class _AccomodationDetailsState extends State<AccomodationDetails> {
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
                      child: Text(widget.accomodation.name,
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
                        Text(widget.accomodation.address,
                            style: const TextStyle(
                                color: Color(0xFFA294C2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        if (await canLaunch(widget.accomodation.location)) {
                          await launch(widget.accomodation.location);
                        } else {
                          throw "Couldn't launch Map";
                        }
                      },
                      child: Icon(Icons.near_me),
                    ),
                  ],
                ),
                widget.accomodation.images.isNotEmpty
                    ? CarouselSlider(
                        options: CarouselOptions(),
                        items: widget.accomodation.images
                            .map((item) => Container(
                                  child: Center(
                                      child: Image.asset(item,
                                          fit: BoxFit.cover, width: 1000)),
                                ))
                            .toList(),
                      )
                    : Text('No images to display'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.accomodation.description,
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
