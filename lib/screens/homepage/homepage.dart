import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/screens/homepage/myhomePage.dart';
import 'package:insult/screens/profile/profile.dart';
import 'package:insult/screens/wordList/wordList.dart';
import 'package:insult/screens/pageView/pageview.dart';
import 'package:insult/widgets/navbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homepage';
  static List<Widget> myPages = [
    MyHomePage(),
    Pageview(),
    WordList(),
    Profile(),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Insult',
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 40,
            foreground: Paint()..shader = linearGradient,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.crop_portrait,
            ),
            onPressed: () {
              Provider.of<Data>(context, listen: false).changeOriented(true);
            },
          ),
          IconButton(
            icon: Icon(Icons.view_agenda),
            onPressed: () {
              Provider.of<Data>(context, listen: false).changeOriented(false);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        sInd: _selectedIndex,
        onp: (index) {
          setState(() {
            _selectedIndex = index;
            print(_selectedIndex);
          });
        },
      ),
      body: HomePage.myPages.elementAt(_selectedIndex),
    );
  }
}
