import 'package:flutter/material.dart';

Widget slideRightBcg() {
  return Container(
    color: Color.fromARGB(255, 238, 155, 155),
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
