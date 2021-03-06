import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insult/screens/loginPage/SignUp.dart';
import 'package:insult/screens/profile/profile.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/screens/homepage/homepage.dart';
import 'package:insult/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Data>(create: (context) => Data()),
        StreamProvider<User>.value(value: AuthServices().user),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: LogInPage.id,
        routes: {
          LogInPage.id: (context) => LogInPage(),
          HomePage.id: (context) => HomePage(),
          Profile.id: (context) => Profile(),
        },
      ),
    );
  }
}
