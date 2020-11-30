import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetData {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  getAllInsult() async {
    List<String> _allData = [];
    var doc = _db.collection('insults').get();
    await doc.then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (element) {
            element.data().forEach((key, value) {
              // print(value[0]);
              _allData.add(value[0]);
            });
          },
        );
      },
    );
    return _allData;
  }

  getLength(User usr) async {
    int length;
    var doc = _db.collection('insults').doc(usr.uid).get();
    await doc.then((DocumentSnapshot documentSnapshot) {
      length = documentSnapshot.data().length;
    });
    return length;
  }

  //! this from realtime database
  // readData() async {
  //   var allWordsFromDatabase = databaseReference.child('Words');
  //   return allWordsFromDatabase;
  // databaseReference.once().then(
  //   (DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value}');
  //     return snapshot.value;
  //   },
  // );
  // }
}
