import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:secondlab/models/tour.dart';
import 'package:secondlab/constants.dart';

class TourDetails extends StatefulWidget {
  final Tour tour;
  const TourDetails({required this.tour});

  @override
  State<TourDetails> createState() => _TourDetailsState();
}

class _TourDetailsState extends State<TourDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          automaticallyImplyLeading: true,
          title: const Text("Almeria Guide"),
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
                      child: Text(widget.tour.name,
                          style: const TextStyle(
                            color: kBlueColor,
                            fontSize: 30.0,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(widget.tour.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      )),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: kGreenColor,
                              size: 10,
                            ),
                          ),
                          Text(widget.tour.places[index],
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      ),
                    );
                  },
                  itemCount: widget.tour.places.length,
                ),
                Image.asset(widget.tour.map, fit: BoxFit.cover, width: 1000)
              ],
            ),
          ),
        ));
  }
}
