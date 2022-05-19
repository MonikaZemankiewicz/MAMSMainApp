import 'package:flutter/material.dart';
import 'package:secondlab/constants.dart';
import 'package:secondlab/screens/event_details.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BasicDetailsPanel extends StatelessWidget {
  final String name;
  final String address;
  final String location;
  final List<String> images;
  final String description;

  const BasicDetailsPanel({
    required this.name,
    required this.address,
    required this.location,
    required this.images,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(name,
              style: const TextStyle(
                color: kAccentColor,
                fontSize: 30.0,
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_pin, color: kPinkColor),
              TextButton(
                onPressed: () async {
                  if (await canLaunch(location)) {
                    await launch(location);
                  } else {
                    throw "Couldn't launch Map";
                  }
                },
                child: Text(address,
                    style: const TextStyle(
                        color: kAddressColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
        images.isNotEmpty
            ? CarouselSlider(
                options: CarouselOptions(),
                items: images
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
          child: Text(description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              )),
        ),
      ],
    );
  }
}
