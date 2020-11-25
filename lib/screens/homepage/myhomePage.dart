import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/services/getData.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../const.dart';

GetData _data = GetData();
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
    // return allData;
    setState(() {
      _allInsultLength = allData.length;
    });
    // print(allData.length);
  }

  CardController controller;
  getfromCloudFirestore() async {
    dynamic data = await _data.getAllInsult();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    fromCloudFirestore();
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: TinderSwapCard(
          swipeUp: true,
          swipeDown: true,
          orientation: AmassOrientation.BOTTOM,
          totalNum: _allInsultLength,
          stackNum: 8,
          swipeEdge: 5,
          maxWidth: Provider.of<Data>(context).oriented
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width,
          maxHeight: Provider.of<Data>(context).oriented
              ? MediaQuery.of(context).size.height * 0.76
              : MediaQuery.of(context).size.height * 0.5,
          minWidth: Provider.of<Data>(context).oriented
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * .8,
          minHeight: Provider.of<Data>(context).oriented
              ? MediaQuery.of(context).size.height * 0.6
              : MediaQuery.of(context).size.height * 0.4,
          cardBuilder: (context, index) {
            return Container(
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
              child: FutureBuilder<dynamic>(
                future: getfromCloudFirestore(),
                builder: (context, snapshot) {
                  // int v = getRandomNumber();
                  if (snapshot.hasData) {
                    print(index);
                    // print(snapshot.data[1]);
                    return Center(
                      child: Text(
                        '${snapshot.data[_i]}',
                        style: bestQuote,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return Center(
                    child: Text(
                      'Loading...........',
                      style: loading,
                    ),
                  );
                },
              ),
            );
          },
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
            ///
            ///
            _i = _random.nextInt(_allInsultLength);
          },
        ),
      ),
    );
  }
}
