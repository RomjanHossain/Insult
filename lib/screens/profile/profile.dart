import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  String userName = '';
  String userProfile = '';
  int _allInsultAdded = 0;

  @override
  void initState() {
    updateUser();
    super.initState();
  }

  void updateUser() async {
    User usr = await _auth.getUser();
    String uN = await _auth.getUsername();
    String uP = await _auth.getProfilePic();
    int ia = await _data.getLength(usr);
    setState(() {
      userName = uN;
      userProfile = uP;
      _allInsultAdded = ia;
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Stack(
      children: [
        Positioned(
          top: 140,
          child: CircleAvatar(
              radius: 80, backgroundImage: NetworkImage(user.photoURL)),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.4,
          left: MediaQuery.of(context).size.width / 3.6,
          child: Row(
            children: [
              MyBtn(() {
                showAboutDialog(
                    context: context,
                    applicationName: 'Insult App',
                    applicationVersion: 'v0.0.1 (Beta Version)',
                    applicationLegalese:
                        '''this is beta app for testing perpose! if you find any issue with this application,you can email me `romjanhossain726526@gmail.com1`!
                        ''');
//                         );
              }, 'View License', Colors.blueGrey[800]),
              SizedBox(
                width: 10,
              ),
              MyBtn(() async {
                await _auth.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LogInPage.id, (Route<dynamic> route) => false);
              }, 'Log Out', Colors.blueGrey[800]),
            ],
          ),
        ),
        Positioned(
            top: 200,
            right: 20,
            child: Text(
              user.displayName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontStyle: FontStyle.italic,
              ),
            )),
        Align(
          alignment: Alignment.center,
          child: Text('Insult Added'),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text('$_allInsultAdded'),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 50,
            width: 100,
            child: MyBtn2(
              () {
                print('ds');
              },
              'Log Out',
              Colors.blue,
              Colors.green,
            ),
          ),
        )
      ],
    );
  }
}
