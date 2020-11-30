import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  bool oriented = true;
  bool showFloatingActionbtn = true;
  bool showappbarActions = true;

  void changeOriented(bool newOri) {
    oriented = newOri;
    notifyListeners();
  }
}
