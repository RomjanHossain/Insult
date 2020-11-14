import 'package:flutter/material.dart';
import 'package:insult/screens/loginPage/SignUp.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/widgets/btn.dart';
import 'package:insult/widgets/profile_wid/customPaint.dart';
import 'package:insult/widgets/profile_wid/myCard.dart';
import 'package:insult/services/auth.dart';
import 'package:provider/provider.dart';

AuthServices _auth = AuthServices();

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getOut() async {
      var usr = await _auth.getUser();
      print('init GetOut');
      if (usr == null) {
        Navigator.pushNamed(context, LogInPage.id);
      }
    }

    getOut();
    // Insults insult = Insults();
    if (!Provider.of<Data>(context).isUser) {
      return Stack(
        children: [
          Image.asset(
            'assets/images/Background/anon.jpeg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Anonymous Logged-in user dont have any Profile! ',
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: MyBtn(() async {
                    print('jslkdjf');

                    await _auth.signOut().then(
                        (value) => Navigator.pushNamed(context, LogInPage.id));

                    // Navigator.pushNamed(context, LogInPage.id);
                  }, 'Log Out', Colors.blueGrey[800]),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 80,
                backgroundImage:
                    AssetImage('assets/images/Profile/profile6.jpeg'),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  // vertical: 10,
                ),
                child: CustomPaint(
                  painter: RPSCustomPainter(),
                  child: Container(
                    alignment: Alignment.center,
                    height: 430,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: MyCard(
                                Icons.emoji_objects,
                                'Insult added (0)',
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: MyCard(
                                Icons.edit,
                                'Word added (0)',
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: MyCard(
                                Icons.whatshot,
                                'Definition added (0)',
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 4.5,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: MyCard(
                                Icons.whatshot_rounded,
                                'example added (0)',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.4,
              left: MediaQuery.of(context).size.width / 2.6,
              child: MyBtn(() {
                print('jslkdjf');
                // String ss = await insult.getData();
                // print(ss);
                _auth.signOut();
                Navigator.pushNamed(context, LogInPage.id);
              }, 'Log Out', Colors.blueGrey[800]),
            ),
            Positioned(
              top: 90,
              right: 50,
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Center(
                  child: Text(
                    'skanthunt49',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
