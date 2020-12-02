import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:insult/const.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/services/getData.dart';
import 'package:flutter/services.dart';
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
    setState(() {
      _allInsultLength = allData.length;
    });
  }

  CardController controller;
  getfromCloudFirestore() async {
    dynamic data = await _data.getAllInsult();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    fromCloudFirestore();
    return Container(
      height: _size.height,
      child: TinderSwapCard(
        swipeUp: true,
        swipeDown: true,
        orientation: AmassOrientation.BOTTOM,
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
          return Container(
            decoration: BoxDecoration(
              color: testColor,
              borderRadius: Provider.of<Data>(context).oriented
                  ? BorderRadius.circular(15)
                  : BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(4, 4),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(.4),
                  blurRadius: 10,
                  offset: Offset(-4, -4),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: FutureBuilder<dynamic>(
              future: getfromCloudFirestore(),
              builder: (context, snapshot) {
                // int v = getRandomNumber();
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          // overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: bestQuote.copyWith(
                              fontSize:
                                  Provider.of<Data>(context).oriented ? 50 : 35,
                            ),
                            children: [
                              TextSpan(
                                text: '"',
                                style: TextStyle(
                                  fontSize: 70,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              TextSpan(
                                text: '${snapshot.data[_i]}',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: "${snapshot.data[_i]}"));
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
                            }),
                      ),
                    ],
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
        swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {},
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          _i = _random.nextInt(_allInsultLength);
        },
      ),
    );
  }
}
