import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:insult/screens/homepage/components/cardOft.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/services/getData.dart';
import 'package:provider/provider.dart';
import 'dart:math';

Random _random = Random();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _allInsultLength = 0;
  int _i = 0;
  GetData _myData = GetData();

  Future fromCloudFirestore() async {
    List<String> allData = await _myData.getAllInsult();
    setState(() {
      _allInsultLength = allData.length;
    });
  }

  CardController controller;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    fromCloudFirestore();
    return Container(
      height: _size.height,
      child: TinderSwapCard(
        swipeUp: true,
        swipeDown: true,
        // orientation: AmassOrientation.BOTTOM,
        totalNum: _allInsultLength,
        stackNum: 8,
        swipeEdge: 5,
        maxWidth: Provider.of<Data>(context).oriented
            ? _size.width * 0.9
            : _size.width,
        maxHeight: Provider.of<Data>(context).oriented
            ? _size.height * 0.76
            : _size.height * 0.5,
        minWidth: Provider.of<Data>(context).oriented
            ? _size.width * 0.8
            : _size.width * .8,
        minHeight: Provider.of<Data>(context).oriented
            ? _size.height * 0.6
            : _size.height * 0.4,
        cardBuilder: (context, index) {
          return CardOfTinder(i: _i);
        },
        cardController: controller = CardController(),
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {},
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          _i = _random.nextInt(_allInsultLength);
        },
      ),
    );
  }
}
