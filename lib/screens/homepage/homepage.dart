import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/screens/loginPage/SignUp.dart';
import 'package:insult/screens/profile/profile.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/screens/homepage/myhomePage.dart';
import 'package:insult/screens/wordList/wordList.dart';
import 'package:insult/screens/pageView/pageview.dart';
import 'package:insult/services/auth.dart';
import 'package:insult/services/getData.dart';
// import 'package:insult/services/postData.dart';
import 'package:insult/widgets/bottomSheet/bottomSheet.dart';
import 'package:insult/widgets/navbar.dart';
import 'package:provider/provider.dart';

AuthServices auth = AuthServices();
GetData _data = GetData();
// PostData _post = PostData();

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

  // if not logged in Kick him out
  getOut() async {
    var usr = await auth.getUser();
    print('init GetOut');
    if (usr == null) {
      Navigator.pushNamed(context, LogInPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    getOut();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Text(
          'Insult',
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 40,
            foreground: Paint()..shader = linearGradient,
          ),
        ),
        actions: (_selectedIndex == 2 || _selectedIndex == 3)
            ? []
            : [
                IconButton(
                  icon: Icon(
                    Icons.home,
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
                print('hellow');
                //! getting data from DB
                // var insults = await _data.getAllInsult();
                // print(insults);
                //! finish
                //? post data
                var usr = await auth.getUser();
                int ll = await _data.getLength(usr);
                // print(ll);
                //? end post data
                // !show bootm sheet
                // showBottomSheet(
                //   context: context,
                //   builder: (context) => Container(
                //     height: MediaQuery.of(context).size.height / 2,
                //     color: Colors.blue,
                //   ),
                // );
                // showDialog(
                //   context: context,
                //   child: Container(
                //     color: Colors.blue,
                //     height: MediaQuery.of(context).size.height / 2,
                //   ),
                // );
                showDialog(
                  context: context,
                  builder: (context) => MyBottomSheet(
                    ll: ll,
                  ),
                );
                // showModalBottomSheet(
                //     context: context, builder: (context) => MyBottomSheet());
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
