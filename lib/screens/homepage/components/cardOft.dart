import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/services/getData.dart';
import 'package:insult/widgets/copyText.dart';
import 'package:provider/provider.dart';

GetData _data = GetData();

class CardOfTinder extends StatelessWidget {
  CardOfTinder({this.i});
  final int i;
  getfromCloudFirestore() async {
    dynamic data = await _data.getAllInsult();
    return data;
  }

  @override
  Widget build(BuildContext context) {
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
          if (snapshot.hasData) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: bestQuote.copyWith(
                        fontSize: Provider.of<Data>(context).oriented ? 50 : 35,
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
                          text: '${snapshot.data[i]}',
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: CopyText(
                    txt: "${snapshot.data[i]}",
                  ),
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
  }
}
