import 'package:flutter/foundation.dart';
import 'package:insult/services/auth.dart';
import 'package:insult/services/getData.dart';

GetData _data = GetData();
AuthServices _auth = AuthServices();

class Data extends ChangeNotifier {
  bool oriented = true;
  bool showFloatingActionbtn = true;
  bool showappbarActions = true;
  int userInsultLength = 0;

  void changeOriented(bool newOri) {
    oriented = newOri;
    notifyListeners();
  }

  void getUserInsultLength() async {
    var user = await _auth.getUser();
    userInsultLength = await _data.getLength(user);
    notifyListeners();
  }
}
