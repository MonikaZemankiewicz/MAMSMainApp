import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:secondlab/models/review.dart';
import 'package:secondlab/constants.dart';

class AddReview extends StatefulWidget {
  final Function addReviewCallback;
  const AddReview({Key? key, required this.addReviewCallback})
      : super(key: key);

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  @override
  Widget build(BuildContext context) {
    String currentComment = '';

    final nameFieldText = TextEditingController();
    final descriptionFieldText = TextEditingController();

    void clearText() {
      nameFieldText.clear();
      descriptionFieldText.clear();
    }

    return Container(
      color: Color.fromARGB(255, 172, 168, 168),
      child: Container(
        decoration: const BoxDecoration(
          color: kBcgColor,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(20.0),
          //   topRight: Radius.circular(20.0),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text('Add Review',
                      style: TextStyle(
                        color: kGreenColor,
                        fontSize: 25.0,
                      )),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    currentComment = newText;
                  },
                  controller: nameFieldText,
                  decoration: InputDecoration(hintText: "Enter your review"),
                ),
                InkWell(
                  onTap: () {
                    widget.addReviewCallback(Review(
                      comment: currentComment,
                    ));
                    clearText();
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: kGreenColor,
                    margin: EdgeInsets.only(top: 30.0),
                    width: double.infinity,
                    height: 80.0,
                    alignment: Alignment.center,
                    child: const Text(
                      "ADD REVIEW",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
