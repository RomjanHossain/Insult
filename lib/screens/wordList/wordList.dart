import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/material.dart';

DatabaseReference _wordsRef;
DatabaseReference allWordsFirebase = FirebaseDatabase.instance.reference();
// DatabaseReference _allWords;

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: allWordsFirebase.child('Words'),
      shrinkWrap: true,
      itemBuilder:
          (_, DataSnapshot snapshot, Animation<double> animation, int x) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          //! I removed ListTile and added Container for using card insted of Tile xD
          child: Container(
            height: 300,
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
                Text(
                  snapshot.key,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                (snapshot.value['Noun'] != null)
                    ? Text('Noun:${snapshot.value["Noun"]}')
                    : Text(''),
                (snapshot.value['Adjective'] != null)
                    ? Text('Adjective:${snapshot.value["Adjective"]}')
                    : Text(''),
              ],
            ),
          ),
        );
      },
    );
  }
}
