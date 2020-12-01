import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostData {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> newPostMethod(User user, String ins, int activeCount) {
    DocumentReference reportRef = _db.collection('insults').doc(user.uid);
    if (activeCount == 0) {
      return reportRef.set(
        {
          'post${activeCount + 1}': [ins, '${user.email.split('@')[0]}']
        },
      );
    }
    return reportRef.update(
      {
        'post${activeCount + 1}': [ins, '${user.email.split('@')[0]}']
      },
    );
  }
}
