import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/widgets/navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          Icon(Icons.home),
          Icon(Icons.home),
        ],
      ),
      body: Container(
        color: primaryColor,
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
    );
  }
}
