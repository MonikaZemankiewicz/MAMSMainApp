import 'package:flutter/material.dart';
import 'package:secondlab/models/place.dart';
import 'package:secondlab/models/review.dart';
import 'package:secondlab/widgets/videoplayer.dart';
import 'package:secondlab/widgets/audioplayer.dart';
import 'package:secondlab/screens/add_review.dart';
import 'package:secondlab/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secondlab/widgets/basic_details_panel.dart';

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
                BasicDetailsPanel(
                    name: widget.place.name,
                    address: widget.place.address,
                    location: widget.place.location,
                    images: widget.place.images,
                    description: widget.place.description),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Play audiodescription:",
                        style: TextStyle(
                            color: kGreenColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
                      child: AudioPlayerPanel(audioasset: widget.place.audio),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: VideoPlayerPanel(videoasset: widget.place.video),
                ),
                widget.place.rated
                    ? Column(
                        children: [
                          const Text("Your rating: ",
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
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                    )),
                                const Icon(Icons.star, color: kYellowColor)
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
