import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22.0),
      children: <TextSpan>[
        TextSpan(
          text: 'Quiz',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        TextSpan(
          text: 'Maker',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    ),
  );
}

Widget blueButton({BuildContext context, String label, buttonWidth}) {
  return Container(
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 48,
    padding: EdgeInsets.symmetric(vertical: 18.0),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
    ),
    alignment: Alignment.center,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
  );
}
