import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostData {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // postinAllInsult() async {
  //   var doc2 = _db.collection('insults').doc('allInsults').set({
  //     'id': 6,
  //     'insult': [
  //       'romjan14',
  //       'do your keepers a huge favor: do a triple summersault through the air, and disappear up your own asshole!'
  //           'romjan22',
  //       'who the duck'
  //     ],
  //   });
  //   print('comple');
  //   return doc2;
  // }

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
