import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:expansion_card/expansion_card.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';
import 'package:insult/const.dart';

DatabaseReference allWordsFirebase = FirebaseDatabase.instance.reference();

// DatabaseReference _allWords;
extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
}

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  Widget textWid(List<dynamic> ew) {
    List<Widget> list = List<Widget>();
    ew.forEach((element) {
      list.add(
        Text(
          'Examples:\n\n${element.toString()}',
          style: exampQ,
        ),
      );

      // toString().substring(1, (snapshot.value["Examples"].toString().length - 1))
    });
    return Column(
      children: list,
    );
  }

  List<Widget> test;
  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: allWordsFirebase.child('Words'),
      shrinkWrap: true,
      itemBuilder:
          (_, DataSnapshot snapshot, Animation<double> animation, int x) {
        return ExpansionCard(
          title: Container(
            // height: 300,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(
                colors: [
                  Color((Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  Color((Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0)
                ],
              ),
            ),

            //? adding stream builder jfkdsjkflajsd;flaksdj
            child: Column(
              children: [
                IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      List<dynamic> valL = snapshot.value["Examples"];
                      valL.forEach((element) {
                        print(element);
                      });
                    }),
                Center(
                  child: Text(
                    snapshot.key.inCaps,
                    style: wordQ,
                  ),
                ),
                (snapshot.value['Noun'] != null)
                    ? Text(
                        'Noun:${snapshot.value["Noun"].toString().substring(1, (snapshot.value["Noun"].toString().length - 1))}',
                        style: nounQ,
                      )
                    : Text(
                        '',
                        style: notIndb,
                      ),
                (snapshot.value['Adjective'] != null)
                    ? Text(
                        'Adjective:${snapshot.value["Adjective"].toString().substring(1, (snapshot.value["Adjective"].toString().length - 1))}',
                        style: adjQ,
                      )
                    : Text(
                        '',
                        style: notIndb,
                      ),
              ],
            ),
          ),
          // margin: EdgeInsetsDirectional.only(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [
                    Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
                    Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0)
                  ],
                ),
              ),
              child: (snapshot.value['Examples'] != null)
                  ? textWid(snapshot.value['Examples'])
                  : Text(
                      'Example: not in database',
                      style: notIndb,
                    ),
            ),
          ],
        );
      },
    );
  }
}
