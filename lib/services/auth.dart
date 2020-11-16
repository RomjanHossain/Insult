import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final DateTime timeCreated = DateTime.now();
  int nums;

  Future<User> getUser() async {
    return _auth.currentUser;
  }

  Stream<User> get user => _auth.authStateChanges();

  // google login
  Future<User> googleSignIn() async {
    try {
      // Trigger the authentication flow
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      createUserData(userCredential.user);
      return userCredential.user;
    } catch (e) {
      print('You got some error \n${e.toString()}');
      return null;
    }
  }

  Future<void> createUserData(User user) {
    // nums = nums + 1;
    DocumentReference reportRef = _db.collection('reports').doc(user.uid);
    return reportRef.set(
      {
        'uid': user.uid,
        'isAdmin': false,
        'created': timeCreated,
        'lastActive': DateTime.now(),
      },
    );
  }

  // Future<void> createUserData(User user) {
  //   DocumentReference reportRef = _db.collection('user').doc(user.uid);
  //   return reportRef.set(
  //     {
  //       'uid': user.uid,
  //       'isAdmin': false,
  //       'created': timeCreated,
  //       'lastActive': DateTime.now(),
  //     },
  //   );
  // }

  // signout
  Future<void> signOut() {
    return _auth.signOut();
  }
}
