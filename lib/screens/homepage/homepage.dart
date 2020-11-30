import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/screens/profile/profile.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/screens/homepage/myhomePage.dart';
import 'package:insult/screens/wordList/wordList.dart';
import 'package:insult/screens/pageView/pageview.dart';
import 'package:insult/services/auth.dart';
import 'package:insult/services/getData.dart';
import 'package:insult/widgets/bottomSheet/bottomSheet.dart';
import 'package:insult/widgets/navbar.dart';
import 'package:provider/provider.dart';

AuthServices auth = AuthServices();
GetData _data = GetData();

class HomePage extends StatefulWidget {
  static const String id = 'myid';
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
  bool isUser = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: testColor,
        title: Text(
          'Insult',
          style: TextStyle(
            letterSpacing: 2,
            fontFamily: 'RaRaleway',
            fontSize: 40,
            foreground: Paint()..shader = linearGradient,
          ),
        ),
        actions: (_selectedIndex == 2 || _selectedIndex == 3)
            ? []
            : [
                IconButton(
                  icon: Icon(
                    Icons.amp_stories,
                    size: 30,
                  ),
                  onPressed: () {
                    Provider.of<Data>(context, listen: false)
                        .changeOriented(true);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.view_agenda),
                  onPressed: () {
                    Provider.of<Data>(context, listen: false)
                        .changeOriented(false);
                  },
                ),
              ],
        elevation: 3,
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
      floatingActionButton: (_selectedIndex == 3 || _selectedIndex == 2)
          ? null
          : FloatingActionButton(
              onPressed: () async {
                var usr = await auth.getUser();
                int ll = await _data.getLength(usr);
                showDialog(
                  context: context,
                  builder: (context) => MyBottomSheet(
                    ll: ll,
                  ),
                );
              },
              backgroundColor: primaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
    );
  }
}
