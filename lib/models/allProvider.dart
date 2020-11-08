import 'package:flutter/foundation.dart';
import 'package:insult/models/readTxt.dart';

class Data extends ChangeNotifier {
  bool oriented = true;
  var allSlangs = [];
  List<String> alpha = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  void changeOriented(bool newOri) {
    oriented = newOri;
    notifyListeners();
  }

  void getAllSlang() async {
    var data = ReadFile();
    var allData = await data.parseJson();
    allSlangs.add(allData);
    notifyListeners();
  }
}
