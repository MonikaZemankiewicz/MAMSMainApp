import 'package:audioplayers/audioplayers.dart';
import 'package:fluid_action_card/FluidActionCard/fluid_action_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:secondlab/models/place.dart';
import 'package:secondlab/models/review.dart';
import 'package:secondlab/widgets/audioplayer.dart';
import 'package:secondlab/widgets/videoplayer.dart';
import 'package:secondlab/screens/add_review.dart';
import 'package:secondlab/constants.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDetails extends StatefulWidget {
  final Place place;
  const PlaceDetails({required this.place});

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  List<String> history = [];
  int averageRate = 0;

  @override
  void initState() {
    super.initState();
    showHistory();
  }

  showHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      history = prefs.getStringList(widget.place.name) ?? [];
      if (history.length > 10) {
        history = history.sublist(history.length - 10).reversed.toList();
      }
    });
  }

  Future<void> saveReview(Review review) async {
    final prefs = await SharedPreferences.getInstance();
    var reviews = prefs.getStringList(widget.place.name) ?? [];
    reviews.add(review.comment);
    prefs.setStringList(widget.place.name, reviews);
    await showHistory();
  }

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
        floatingActionButton: FloatingActionButton(
          backgroundColor: kGreenColor,
          child: Icon(Icons.star, color: kYellowColor),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) =>
                  AddReview(addReviewCallback: (Review newReview) async {
                await saveReview(newReview);
              }),
              //isScrollControlled: true,
            );
          },
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
                      child: Text(widget.place.name,
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
                        Text(widget.place.address,
                            style: const TextStyle(
                                color: Color(0xFFA294C2),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    TextButton(
                      onPressed: () async {
                        if (await canLaunch(widget.place.location)) {
                          await launch(widget.place.location);
                        } else {
                          throw "Couldn't launch Map";
                        }
                      },
                      child: Icon(Icons.near_me),
                    ),
                  ],
                ),
                widget.place.images.isNotEmpty
                    ? CarouselSlider(
                        options: CarouselOptions(),
                        items: widget.place.images
                            .map((item) => Container(
                                  child: Center(
                                      child: Image.asset(item,
                                          fit: BoxFit.cover, width: 1000)),
                                ))
                            .toList(),
                      )
                    : const Text('No images to display'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AudioPlayerPanel(
                      audioasset: "audios/" + widget.place.audio),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(widget.place.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: VideoPlayerPanel(videoasset: widget.place.video),
                ),
                Text("REVIEWS",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                history.length != 0
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(history[index]),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("No reviews yet. Add first review."),
                      ),
                // FluidActionCard(
                //   assetimage: 'assets/images/1.png',
                //   color1: Colors.pinkAccent,
                //   color2: Colors.black45,
                //   backgroundcolor: Colors.grey[900]!,
                //   borderRadius1: BorderRadius.circular(20),
                //   borderRadius2: BorderRadius.circular(20),
                //   height: 400.0,
                //   width: 240.0,
                //   CardCount: history.length,
                //   Position: 250.0,
                //   shadow: const BoxShadow(
                //     color: Colors.black12,
                //     blurRadius: 10.0,
                //     spreadRadius: 0.2,
                //     offset: Offset(0, 3),
                //   ),
                //   ontap: () {},
                // ),
              ],
            ),
          ),
        ));
  }
}
