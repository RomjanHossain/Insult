import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  bool oriented = true;
  bool isUser = false;

  void changeOriented(bool newOri) {
    oriented = newOri;
    notifyListeners();
  }
}
