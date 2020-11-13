import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  bool oriented = true;

  void changeOriented(bool newOri) {
    oriented = newOri;
    notifyListeners();
  }
}
