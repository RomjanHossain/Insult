import 'package:flutter/material.dart';
import 'package:insult/const.dart';

class MyCard extends StatelessWidget {
  MyCard(this.iconData, this.title);
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF30475e),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconData,
            size: 50,
          ),
          Text(
            title,
            style: textSTyle,
          ),
        ],
      ),
    );
  }
}
