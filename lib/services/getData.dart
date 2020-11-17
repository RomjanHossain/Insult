import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insult/services/auth.dart';

class GetData {
  AuthServices _auth = AuthServices();
  FirebaseFirestore _db = FirebaseFirestore.instance;
}
