import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insult/screens/loginPage/SignUp.dart';
import 'package:insult/screens/profile/components/profileParentContainer.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/widgets/btn.dart';
import 'package:insult/services/auth.dart';
import 'package:provider/provider.dart';

AuthServices _auth = AuthServices();

class Profile extends StatelessWidget {
  static const String id = 'proID';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var user = Provider.of<User>(context);
    Provider.of<Data>(context).getUserInsultLength();
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ProfileParentContainer(),
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
              Text(
                user.displayName,
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
