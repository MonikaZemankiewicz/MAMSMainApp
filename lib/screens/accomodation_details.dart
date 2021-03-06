import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:secondlab/models/accomodation.dart';
import 'package:secondlab/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:secondlab/screens/add_review.dart';
import 'package:secondlab/models/review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:secondlab/widgets/basic_details_panel.dart';

class AccomodationDetails extends StatefulWidget {
  final Accomodation accomodation;
  const AccomodationDetails({required this.accomodation});

  @override
  State<AccomodationDetails> createState() => _AccomodationDetailsState();
}

class _AccomodationDetailsState extends State<AccomodationDetails> {
  List<String> commentsHistory = [];
  bool rated = false;
  int currentRate = 3;

  @override
  void initState() {
    super.initState();
    showHistory();
  }

  showHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      commentsHistory = prefs.getStringList(widget.accomodation.name) ?? [];
      if (commentsHistory.length > 10) {
        commentsHistory = commentsHistory
            .sublist(commentsHistory.length - 10)
            .reversed
            .toList();
      }
    });
  }

  Future<void> saveReview(Review review) async {
    final prefs = await SharedPreferences.getInstance();
    var reviews = prefs.getStringList(widget.accomodation.name) ?? [];
    reviews.add(review.comment);
    prefs.setStringList(widget.accomodation.name, reviews);
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
                BasicDetailsPanel(
                    name: widget.accomodation.name,
                    address: widget.accomodation.address,
                    location: widget.accomodation.location,
                    images: widget.accomodation.images,
                    description: widget.accomodation.description),
                widget.accomodation.rated
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
                                Text(widget.accomodation.rate.toString(),
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
                                widget.accomodation.rated = true;
                                widget.accomodation.rate = currentRate;
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
