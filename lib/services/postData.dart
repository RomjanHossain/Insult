import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PD {
  int idNum;
  String userName;
  String insult;
  PD({this.idNum, this.insult, this.userName});
  List postdata() {
    return [idNum, userName, insult];
  }
}

class PostData {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  postinAllInsult() async {
    var doc2 = _db.collection('insults').doc('allInsults').set({
      'id': 6,
      'insult': [
        'romjan14',
        'do your keepers a huge favor: do a triple summersault through the air, and disappear up your own asshole!'
            'romjan22',
        'who the duck'
      ],
    });
    print('comple');
    return doc2;
  }

  Future<void> newPostMethod(User user, String ins, int activeCount) {
    DocumentReference reportRef = _db.collection('insults').doc(user.uid);
    return reportRef.update(
      {
        'post${activeCount + 1}': [ins, '${user.email.split('@')[0]}']
      },
    );
  }
}
