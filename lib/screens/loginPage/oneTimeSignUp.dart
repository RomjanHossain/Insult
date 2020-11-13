import 'package:flutter/material.dart';
import 'package:insult/screens/profile/profile.dart';
import 'package:insult/services/auth.dart';

class LogInPage extends StatefulWidget {
  static const String id = '/myid';
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  AuthServices auth = AuthServices();
  @override
  void initState() {
    super.initState();
    auth.getUser().then((user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/Background/background4.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton.icon(
                  color: Colors.black,
                  onPressed: () async {
                    print('Goolge clicked');
                    var user = await auth.googleSignIn();
                    if (user != null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    }
                  },
                  icon: Icon(Icons.golf_course),
                  label: Text('Sign In With GooGle'),
                ),
                FlatButton.icon(
                  color: Colors.black,
                  onPressed: () async {
                    print('anno');
                    var user = await auth.annonLogin();
                    if (user != null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    }
                  },
                  icon: Icon(Icons.euro_symbol),
                  label: Text('Go Annoymusly'),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
