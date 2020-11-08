import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:insult/models/allProvider.dart';
import 'package:provider/provider.dart';

import '../../const.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CardController controller;

  List<String> welcomeImages = [
    "assets/welcome0.png",
    "assets/welcome1.png",
    "assets/welcome2.png",
    "assets/welcome2.png",
    "assets/welcome1.png",
    "assets/welcome1.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: TinderSwapCard(
          swipeUp: true,
          swipeDown: true,
          orientation: AmassOrientation.BOTTOM,
          totalNum: welcomeImages.length,
          stackNum: 3,
          swipeEdge: 4,
          maxWidth: Provider.of<Data>(context).oriented
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width,
          maxHeight: Provider.of<Data>(context).oriented
              ? MediaQuery.of(context).size.height * 0.8
              : MediaQuery.of(context).size.height * 0.5,
          minWidth: Provider.of<Data>(context).oriented
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * .8,
          minHeight: Provider.of<Data>(context).oriented
              ? MediaQuery.of(context).size.height * 0.6
              : MediaQuery.of(context).size.height * 0.4,
          cardBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Provider.of<Data>(context).oriented
                  ? Colors.lightBlue
                  : Color(0xFF00b497),
              borderRadius: Provider.of<Data>(context).oriented
                  ? BorderRadius.circular(15)
                  : BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                ),
              ],
            ),
            child: Text(
              welcomeImages[index],
              style: textSTyle,
            ),
          ),
          cardController: controller = CardController(),
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //Card is RIGHT swiping
            }
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            /// Get orientation & index of swiped card!
            ///
          },
        ),
      ),
    );
  }
}
