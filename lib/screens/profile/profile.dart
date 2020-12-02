import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/screens/loginPage/SignUp.dart';
import 'package:insult/services/getData.dart';
import 'package:insult/widgets/btn.dart';
import 'package:insult/services/auth.dart';
import 'package:provider/provider.dart';

AuthServices _auth = AuthServices();
GetData _data = GetData();

class Profile extends StatefulWidget {
  static const String id = 'proID';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _allInsultAdded = 0;

  @override
  void initState() {
    updateUser();
    super.initState();
  }

  void updateUser() async {
    User usr = await _auth.getUser();
    int ia = await _data.getLength(usr);
    setState(
      () {
        _allInsultAdded = ia;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var user = Provider.of<User>(context);
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: size.height / 1.5,
            decoration: BoxDecoration(
              color: testColor,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.white.withOpacity(.4),
                  offset: Offset(-4, -4),
                  spreadRadius: 2,
                ),
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: Offset(4, 4),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: (_allInsultAdded == 0)
                ? Padding(
                    padding: EdgeInsets.only(
                      top: 120,
                      bottom: 100,
                    ),
                    child: Container(
                      height: size.height / 2.5,
                      decoration: BoxDecoration(
                        color: Color(0xFF182C61),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                            offset: Offset(4, 4),
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(.4),
                            blurRadius: 5,
                            offset: Offset(-4, -4),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'You haven\'t added any insult',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, __) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 120,
                          bottom: 100,
                        ),
                        child: Container(
                          height: size.height / 2.5,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                offset: Offset(4, 4),
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(.4),
                                blurRadius: 5,
                                offset: Offset(-4, -4),
                                spreadRadius: 1,
                              ),
                            ],
                            color: Color(0xFF182C61),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: FutureBuilder(
                            future: _data.getOnlyFromUser(user),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Stack(children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text('insult #${__ + 1}'),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${snapshot.data[__]}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Raleway',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ]);
                              } else {
                                return Center(child: Text('Loading........'));
                              }
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: _allInsultAdded,
                  ),
          ),
        ),
        Positioned(
          top: 20,
          left: size.width / 3.5,
          child: Column(
            children: [
              CircleAvatar(
                radius: 90,
                backgroundColor: Colors.blueGrey.withOpacity(.3),
                child: CircleAvatar(
                  radius: 85,
                  backgroundImage: (user.photoURL != null)
                      ? NetworkImage(user.photoURL)
                      : AssetImage('assets/images/profile/profile6.jpeg'),
                ),
              ),
              (user.displayName != null)
                  ? Text(
                      user.displayName,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      'Gerald Broflovski',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: size.width / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 120,
                child: MyBtn3(
                  () {
                    showAboutDialog(
                        context: context,
                        applicationName: 'Insult App',
                        applicationVersion: 'v0.0.3 (Beta Version)',
                        applicationLegalese:
                            '''This is a beta app for testing purposes! if you find any issue with this application, you can mail me at `romjanhossain726526@gmail.com`!
                              ''');
//                         );
                  },
                  'View License',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: MyBtn2(
                  () async {
                    await _auth.signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LogInPage.id, (Route<dynamic> route) => false);
                  },
                  'Log Out',
                  Colors.blueGrey,
                  Colors.blueGrey[200],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
