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
  List<String> commentsHistory = [];
  int currentRate = 3;

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      commentsHistory = prefs.getStringList(widget.place.name) ?? [];
      commentsHistory = commentsHistory.reversed.toList();
    });
  }

  Future<void> saveReview(Review review) async {
    final prefs = await SharedPreferences.getInstance();
    var reviews = prefs.getStringList(widget.place.name) ?? [];
    reviews.add(review.comment);
    prefs.setStringList(widget.place.name, reviews);
    await getHistory();
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
              const Text("Almeria Guide")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kGreenColor,
          child: const Icon(Icons.star, color: kYellowColor),
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
                        const SizedBox(width: 10.0),
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
                      child: const Icon(Icons.near_me),
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
                widget.place.rated
                    ? Column(
                        children: [
                          Text("Your rating: ",
                              style: TextStyle(
                                color: kGreenColor,
                                fontSize: 25.0,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.place.rate.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    )),
                                Icon(Icons.star, color: kYellowColor)
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: Text('Add Rating',
                              style: TextStyle(
                                color: kGreenColor,
                                fontSize: 25.0,
                              )),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0,
                            ),
                          ),
                          child: Slider(
                            divisions: 4,
                            value: currentRate.toDouble(),
                            min: 1,
                            max: 5,
                            label: currentRate.toString(),
                            activeColor:
                                const Color.fromARGB(255, 153, 111, 124),
                            onChanged: (double newValue) {
                              setState(() {
                                currentRate = newValue.round();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.place.rated = true;
                                widget.place.rate = currentRate;
                              });
                            },
                            child: Container(
                              color: kGreenColor,
                              //margin: EdgeInsets.only(top: 30.0),
                              width: double.infinity,
                              height: 60.0,
                              alignment: Alignment.center,
                              child: const Text(
                                "ADD RATING",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                const Text("REVIEWS",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                commentsHistory.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: commentsHistory.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(commentsHistory[index]),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      )
                    : const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("No reviews yet. Add first review."),
                      ),
              ],
            ),
          ),
        ));
  }
}
