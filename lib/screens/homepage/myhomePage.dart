import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/models/api/getResultfromAPI.dart';
import 'package:insult/services/getData.dart';
import 'package:provider/provider.dart';

import '../../const.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GetData _myData = GetData();
  Future<Insults> futureInsult;
  Insults insult = Insults();
  @override
  void initState() {
    super.initState();
    futureInsult = fetchAlbum2();
  }

  List<String> insults = [];
  Future listOfInsults() async {
    String _dd = await insult.getData();
    insults.add(_dd);
    return insults;
  }

  Future fromCloudFirestore() async {
    List<String> allData = await _myData.getAllInsult();
    // return allData;
    print(allData.length);
  }

  CardController controller;

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
          totalNum: 5,
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
            child: FutureBuilder<Insults>(
              future: futureInsult,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.insult,
                    style: bestQuote,
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Text('loading.........');
              },
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
