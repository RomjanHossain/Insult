import 'dart:convert';
import 'package:flutter/services.dart';

class ReadFile {
  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/data.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
    return jsonResponse;
  }
}
