import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insult/const.dart';

class CopyText extends StatelessWidget {
  CopyText({this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.copy),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: txt));
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: testColor,
            behavior: SnackBarBehavior.fixed,
            duration: Duration(milliseconds: 10),
            content: Text(
              'Text copied!',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
