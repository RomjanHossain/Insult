import 'package:cloud_firestore/cloud_firestore.dart';

class GetData {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  getAllInsult() async {
    var doc = _db.collection('insults').get();
    await doc.then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        element.data().forEach((key, value) {
          print(value[0]);
        });
      });
    });
  }
}

/*
// document snapshot
FirebaseFirestore.instance
    .collection('users')
    .doc(userId)
    .get()
    .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });

// querysnapshot
FirebaseFirestore.instance
    .collection('users')
    .get()
    .then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((doc) {
            print(doc["first_name"]);
        });
    });

*/
